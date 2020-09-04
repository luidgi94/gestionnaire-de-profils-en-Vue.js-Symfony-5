
<template>
    
    <div class="col-md-11 col-md-offset-1">
        <popupNotification ref="popupNotification"/>
        <div class="row">
            <div class="col-sm-12">
                <h2 id="Infotitre" class="pull-left project-title">Liste des professeurs</h2>
                <button class="btn btn-default btn-sm pull-right" data-toggle="modal" data-target="#passwordCreate" @click="miseAjourFormulaire" >Ajouter un professeur à la liste</button>
            </div>
        </div>
                     
        <hr>
        <section v-if="isVisible" >
            <div  class="loader-overlay">
                <div class="loader"></div>
                <span class="text" v-html="text"></span>
            </div>
        </section> 
        <section v-if="errorFormDataBase" id="InfoErreur" >
            <p><span class="glyphicon glyphicon-alert" aria-hidden="true"></span> Nous rencontrons un problème sur l'enregistrement des informations que vous nous avez envoyé, <br> Le formulaire d'inscription a probablement mal été renseigné ou incomplet, veuillez réessayer en ajoutant des modifications. </p>
        </section>
        
        <section v-if="errored" id="InfoErreur" >
            <p><span class="glyphicon glyphicon-alert" aria-hidden="true"></span> Nous rencontrons un problème sur l'affichage de ces informations actuellement, veuillez reéssayer plus-tard.<br> Les informations envoyée par Json sont certainement erronées ! </p>
        </section>
        <section v-else>
            <section v-if="GlobalLoading" id="InfoErreur">
                  <div >Loading...</div>
                   <div class="loader-overlay">
                        <div class="loader"></div>
                        <span class="text" v-html="text"></span>
                  </div>
            </section>
            <section v-else>
            <div v-if="professeurs.length > 0">
                <!-- Search form -->
                <!-- Don't forget to bind the property with ":" (we forget all the time!) -->
            
                <form id="rechercheDiv" class="form-inline d-flex justify-content-center md-form form-sm mt-0">
                    <span class="purple lighten-3" id="basic-text1"> <font-awesome-icon icon="search" /> </span>
                    <input class="form-control form-control-sm ml-3 w-75"  v-on:keyup="searchInList" id="tableSearch" type="text" placeholder="Rechercher un professeur..." aria-label="Search">
                </form>

                <div class="panel panel-default">
                  
                <br>
                    <table class="table table-condensed ">
                        <thead>
                        <tr>
                            <th class="text-center">#</th>
                            <th class="text-center">Avatar</th>
                            <th class="text-center">Prénom</th>
                            <th class="text-center">Nom</th>
                            <th class="text-center">Username</th>
                            <th class="text-center">Matière</th>
                            <th class="text-center">Session</th>
                            <th class="text-center">Email</th>
                            <th class="text-center">Inscrit_depuis_:</th>
                            <th class="text-center">Update</th>
                            <th class="text-center">Delete</th>
                        </tr>
                        </thead>
                        <tbody name="list" is="transition-group" id="list">
                         
                         <tr v-for="prof in orderBy(professeurs, 'firstName') " :key="prof.id">
                            
                            <td class="text-right col-md-1">{{ prof.id }}</td>
                            <td class="col-md-2">
                                <div><img :src="'img/avatars/' + prof.parameter.avatarFileName" width="40px" height="40px" alt="Image de profil"></div></td>
                            <td class="col-md-2">{{ prof.parameter.firstName }}</td>
                            <td class="col-md-2">{{ prof.parameter.lastName }}</td>
                            <td class="col-md-2">{{ prof.username }}</td>
                            <td class="col-md-6">{{ prof.professeur.matter }}</td>
                            <td class="col-md-6">
                                <span v-if="prof.professeur.session.length >1">
                                     <span v-for="session in prof.professeur.session" :key="session.id">
                                    {{ session.entitled }},
                                    </span>
                                </span>
                                <span v-else-if="prof.professeur.session.length ==1">
                                     <span v-for="session in prof.professeur.session" :key="session.id">
                                    {{ session.entitled }}
                                    </span>
                                </span>
                            </td>  
                            <td class="col-md-2">{{ prof.email }}</td>
                            <td class="text-center col-md-1"><span class="label" v-bind:class="[isExpired(prof.createdAt) ? 'label-danger' : 'label-success']">{{ calculInterval(prof.createdAt) }}</span></td>
                            <td class="text-center col-md-1">
                                <button type="button" class="btn btn-info" @click="miseAjourFormulaire();editTeacher({id: prof.id, firstName: prof.parameter.firstName, lastName: prof.parameter.lastName, genre:prof.parameter.genre, datebirth: formateDate(prof.parameter.datebirth), email: prof.email, session: prof.professeur.session, formation: prof.professeur.formation, username:prof.username, note:prof.note});" data-toggle="modal" data-target="#passwordEdit"><span class="glyphicon glyphicon-pencil"></span></button>
                            </td>
                            <td class="text-center col-md-1">                               
                                <button type="button" class="btn btn-danger"  data-toggle="modal" data-target="#suppression" @click="deleteProf({id: prof.id, firstName: prof.parameter.firstName, lastName: prof.parameter.lastName})" ><span class="glyphicon glyphicon-trash"></span></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div v-else>
                    <h3 align="center">Aucun professeur n'est encore enregistré</h3>
            </div>
            </section>
        </section>

        <!-- FIN DE LA LISTE DES PROFS -->

        <!-- SUPRESSION DE PROFIL CONFIRMATION  -->

        <div class="modal fade" id="suppression" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-md">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" @click="razEditedPassword">×</button>
                            <h4 class="modal-title">Suppression définitive d'un professeur :</h4>
                        </div>
                            <div class="modal-body">
                                <div class="form-horizontal row-border">
                                    <div class="form-group">
                                        <div class="col-md-10">
                                            <p ><span class="glyphicon glyphicon-alert" aria-hidden="true"></span>  Attention !!  La suppression  du profil enseignant de {{professeurDeleteId.lastName}} {{professeurDeleteId.firstName}}sera faite de manière définitive. </p>
                                            <p class="error-message">Si vous supprimez ce profil, les données le concernant seront perdus.</p>
                                        </div>
                                        <button data-dismiss="modal"  @click="deleteTeacher(professeurDeleteId.id)" type="submit" value="Submit" id= "deletebtn" class="btn btn-default btn-success">Supprimer le profil de {{professeurDeleteId.lastName}} {{professeurDeleteId.firstName}}</button>
                                    </div>
                                </div>
                            </div>
                    </div>
            </div>
        </div>

        <!-- FIN FORMULAIRE DE SUPPRESSION DE PROFIL -->


        <!-- FORMULAIRE D'AJOUT DE PROFESSEUR  ::  -->
        <div class="modal fade" id="passwordCreate" role="dialog" @click="updateFormationChoix">
            <div class="modal-dialog modal-md">
               
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" @click="razNewProfesseur" >×</button>
                            <h4 class="modal-title">Ajout d'un nouveau professeur :</h4>
                        </div>
                        
                            <div class="modal-body">

                                <div class="form-horizontal row-border">
                                    <div id = "genre" class="tableForm" >
                                        <div class="Column"><span ><strong>Genre :  </strong></span>  </div>
                                        <div class="form-check  Column">
                                        <input v-model="newProfesseur.genre" class="form-check-input" type="radio" name="genre" id="genre1" value="homme" checked >
                                        <label class="form-check-label" for="genre1">
                                            Homme
                                        </label>
                                        </div>
                                        <div class="form-check Column">
                                        <input v-model="newProfesseur.genre" class="form-check-input" type="radio" name="genre" id="genre2" value="femme">
                                        <label class="form-check-label" for="genre2">
                                            Femme
                                        </label>
                                        </div>
                                        
                                    </div>
                                     <p v-if="!genreIsValid  && firstSubmit" class="error-message2"> Vous devez choisir un genre</p>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Prénom</label>
                                        <div class="col-md-10">
                                            <input v-model="newProfesseur.firstName" v-on:keyup.enter="submit" type="text" class="form-control" id="titre-firstname" placeholder="Prénom">
                                            <p v-if="!newProfesseur.firstName && firstSubmit" class="error-message"> Vous devez renseigner un prénom pour ce profil</p>
                                            <p v-if="!firstNameIsValid.formIsValid && newProfesseur.firstName && firstSubmit" class="error-message"> Le prénom n'est pas valide</p>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Nom</label>
                                        <div class="col-md-10">
                                            <input v-model="newProfesseur.lastName" type="text" class="form-control" id="titre-password" placeholder="Nom">
                                             <p v-if="!newProfesseur.lastName && firstSubmit" class="error-message"> Vous devez renseigner un nom pour ce profil</p>
                                            <p v-if="!lastNameIsValid && firstSubmit" class="error-message"> Le nom n'est pas valide</p>
                                        </div>
                                    </div>
                                    <fvl-form :data="form" url="/datepicker" class="relative">
                                        <fvl-date-picker 
                                            :value.sync="form.date" 
                                            name="startdate"
                                            label="Date de Naissance"
                                            placeholder="Choisissez une date"
                                            min="1930-01-01"
                                            max="2008-01-01"
                                        />
                                        <p v-if="!datebirthIsValid  && firstSubmit" class="error-message2"> la date de naissance n'est pas valide</p>
                                    </fvl-form>
                                     

                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Username</label>
                                        <div class="col-md-10">
                                            <input v-model="newProfesseur.username" type="text" class="form-control" id="username" placeholder="Username">
                                             <p v-if="!newProfesseur.username && firstSubmit" class="error-message"> Vous devez renseigner un "username" pour ce profil</p>
                                            <p v-if="!usernameIsValid && newProfesseur.username && firstSubmit" class="error-message"> Le username n'est pas valide</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" for="exampleFormControlInput1">Email address</label>
                                        <div class="col-md-10">
                                        <input v-model="newProfesseur.email" type="email" class="form-control" id="email"  @click.once="getAllEmails" placeholder="name@example.com">
                                        <p v-if="!newProfesseur.email  && firstSubmit" class="error-message"> Vous devez renseigner un email pour ce profil</p>
                                        <p v-if="!emailIsValid.emailForm && newProfesseur.email && firstSubmit" class="error-message"> L'email n'est pas valide</p>
                                        <p v-if="emailIsValid.emailExist && newProfesseur.email" class="error-message"> L'email est déjà utilisé sur la plateforme</p>
                                        </div>
                                    </div>

                                    <!-- /////////////////////////PLUGIN MULTISELECT  SESSION //////////////////// -->
                                    <div id="form-multiselect" >
                                        <label class="typo__label multiselectLabel" >Session(s)</label>
                                        <multiselect     class="Column" v-model="sessionSelectedValue" :options="sessionOptions" :multiple="true" :close-on-select="false" :clear-on-select="false" :preserve-search="true" placeholder="Selectionnez une session..." label="entitled" track-by="entitled" :preselect-first="false">
                                            <template class="Column" slot="selection" slot-scope="{ values, search, isOpen }"><span class="multiselect__single"  v-if="values.length &amp;&amp; !isOpen">{{ values.length }} Session(s) choisie.</span></template>
                                        </multiselect>
                                        <!-- //affichage des selectionnées données en json
                                        <pre class="language-json"><code>{{ value  }}</code></pre> -->
                                    </div>
                                      <p v-if="!sessionIsValid  && firstSubmit" class="error-message2"> Vous devez renseigner une session pour ce profil</p>
                                    <!-- /////////////////////////PLUGIN MULTISELECT //////////////////// -->

                                      <!-- /////////////////////////PLUGIN MULTISELECT  FORMATION //////////////////// -->
                                    <div id="form-multiselect">
                                        <label class="typo__label multiselectLabel" >Formation(s)</label>
                                        <multiselect class="Column" v-model="formationSelectedValue" :options="formationSelectedOptions" :multiple="true" :close-on-select="false" :clear-on-select="false" :preserve-search="true"    placeholder="Selectionnez une formation..." label="title" track-by="id" :preselect-first="false">
                                            <template class="Column" slot="selection" slot-scope="{ values, search, isOpen }"><span class="multiselect__single"  v-if="values.length &amp;&amp; !isOpen">{{ values.length }} Formation(s) choisie.</span></template>
                                        </multiselect>
                                        <!-- //affichage des selectionnées données en json -->
                                        <!-- <pre class="language-json"><code>{{ formationSelectedValue  }}</code></pre>  -->
                                    </div>
                                      <p v-if="!sessionIsValid  && firstSubmit" class="error-message2"> Vous devez renseigner une session pour ce profil</p>
                                    <!-- /////////////////////////PLUGIN MULTISELECT FORMATION  //////////////////// -->

                               
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Mot de passe</label>
                                        <div class="col-md-8">
                                            <input v-model="newProfesseur.password" type="text" class="form-control" id="passwordprof" placeholder="Mot de passe">                                       
                                             <p v-if="!newProfesseur.password && firstSubmit" class="error-message"> Vous devez renseigner un mot de passe pour ce profil</p>
                                            <span v-if="newProfesseur.password">
                                            <p  class="error-message" v-for="error in passwordValidation.errors" :key="error" >=>{{error}} </p> 
                                            </span>
                                        </div>
                                        <div class="col-md-2">
                                            <button @click="generatePassword('new')" id="aleatoire2" class="btn btn-default btn-success ">Aléatoire</button>
                                        </div>
                                    </div>

                                     <div class="form-group">
                                        <label class="col-md-2 control-label">Confirmer Mot de passe</label>
                                        <div class="col-md-8">
                                            <input v-model="newProfesseur.passwordConfirm" type="password" class="form-control" id="passwordconfirm" placeholder="Confirmez le mot de passe">                                           
                                            <p v-if="!PasswordConfirmIsValid  && newProfesseur.passwordConfirm" class="error-message"> Les mots de passe ne sont pas identiques.</p>
                                        </div>
            
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Remarque</label>
                                        <div class="col-md-10">
                                            <textarea v-model="newProfesseur.note" class="form-control" id="note" placeholder="Ajoutez une note spéciale concernant ce profil"></textarea>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            <div class="modal-footer">
                                <div class="col-md-12">
                                    <button data-dismiss="modal" :disabled="!formIsValid  && firstSubmit" @click="AjouterProfesseur" type="submit" value="Submit" class="btn btn-default btn-success">Ajouter</button>                           
                                </div>
                            </div>              
                    </div>
                
            </div>
        </div>




        <!-- Edit Password Modal -->
        <div class="modal fade" id="passwordEdit" tabindex="-1" role="dialog"  @click="updateFormationChoix">
            <div class="modal-dialog modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" @click="razEditedPassword">×</button>
                        <h4 class="modal-title">Modification du profil enseignant</h4>
                    </div>
                    <div class="modal-body">
                        <!-- //////////////////////////////////////////////
                        ///////////////////////////////////////////// -->


                            <div class="form-horizontal row-border">
                                    <div id = "genre" class="tableForm" >
                                        <div class="Column"><span ><strong>Genre :  </strong></span>  </div>
                                        <div class="form-check  Column">
                                        <input v-model="teacherEdited.genre" class="form-check-input" type="radio" name="genre" id="genre3" value="homme" disabled>
                                        <label class="form-check-label" for="genre3">
                                            Homme
                                        </label>
                                        </div>
                                        <div class="form-check Column">
                                        <input v-model="teacherEdited.genre" class="form-check-input" type="radio" name="genre" id="genre4" value="femme" disabled>
                                        <label class="form-check-label" for="genre4">
                                            Femme
                                        </label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Prénom</label>
                                        <div class="col-md-10">
                                            <input v-model="teacherEdited.firstName" v-on:keyup.enter="submit" type="text" class="form-control" id="titre-firstname-edit" placeholder="Prénom" disabled>
                                            <!-- <p v-if="!firstNameIsValid.formIsValid && teacherEdited.firstName && firstSubmit" class="error-message"> Le prénom n'est pas valide</p> -->
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Nom</label>
                                        <div class="col-md-10">
                                            <input v-model="teacherEdited.lastName" type="text" class="form-control" id="titre-password-edit" placeholder="Nom" disabled>
                                            <!-- <p v-if="!lastNameIsValid.formIsValid && teacherEdited.lastName && firstSubmit" class="error-message"> Le nom n'est pas valide</p> -->
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Date de Naissance</label>
                                        <div class="col-md-10">
                                            <input v-model="teacherEdited.datebirth" type="text" class="form-control" id="datebirth" placeholder="Nom" disabled>
                                            <!-- <p v-if="!lastNameIsValid.formIsValid && teacherEdited.lastName && firstSubmit" class="error-message"> Le nom n'est pas valide</p> -->
                                        </div>
                                    </div>
                                
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Username</label>
                                        <div class="col-md-10">
                                            <input v-model="teacherEdited.username" type="text" class="form-control" id="usernameEdited" placeholder="Username">
                                            <p v-if="!editUsernameIsValid && teacherEdited.username && firstSubmit" class="error-message"> Le username n'est pas valide</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label" for="exampleFormControlInput1">Email address</label>
                                        <div class="col-md-10">
                                        <input v-model="teacherEdited.email" type="email" class="form-control" id="email-edit"  @click.once="getAllEmails" placeholder="name@example.com">
                                        <p v-if="!editEmailIsValid.emailForm && teacherEdited.email && firstSubmit" class="error-message"> L'email n'est pas valide</p>
                                        <p v-if="editEmailIsValid.emailExist && teacherEdited.email" class="error-message"> L'email est déjà utilisé sur la plateforme</p>
                                        </div>
                                    </div>

                                    <!-- /////////////////////////PLUGIN MULTISELECT  SESSION //////////////////// -->
                                    <div id="form-multiselect" >
                                        <label class="typo__label multiselectLabel" >Session(s)</label>
                                        <multiselect     class="Column" v-model="sessionSelectedValue" :options="sessionOptions" :multiple="true" :close-on-select="false" :clear-on-select="false" :preserve-search="true" placeholder="Selectionnez une session..." label="entitled" track-by="entitled" :preselect-first="false">
                                            <template class="Column" slot="selection" slot-scope="{ values, search, isOpen }"><span class="multiselect__single"  v-if="values.length &amp;&amp; !isOpen">{{ values.length }} Session(s) choisie.</span></template>
                                        </multiselect>
                                        <!-- //affichage des selectionnées données en json
                                        <pre class="language-json"><code>{{ value  }}</code></pre> -->
                                    </div>
                                      <p v-if="!editSessionIsValid  && firstSubmit" class="error-message2"> Vous devez renseigner une session pour ce profil</p>
                                    <!-- /////////////////////////PLUGIN MULTISELECT //////////////////// -->

                                      <!-- /////////////////////////PLUGIN MULTISELECT  FORMATION //////////////////// -->
                                    <div id="form-multiselect">
                                        <label class="typo__label multiselectLabel" >Formation(s)</label>
                                        <multiselect class="Column" v-model="formationSelectedValue" :options="formationSelectedOptions" :multiple="true" :close-on-select="false" :clear-on-select="false" :preserve-search="true"    placeholder="Selectionnez une formation..." label="title" track-by="id" :preselect-first="false">
                                            <template class="Column" slot="selection" slot-scope="{ values, search, isOpen }"><span class="multiselect__single"  v-if="values.length &amp;&amp; !isOpen">{{ values.length }} Formation(s) choisie.</span></template>
                                        </multiselect>
                                        <!-- //affichage des selectionnées données en json -->
                                        <!-- <pre class="language-json"><code>{{ formationSelectedValue  }}</code></pre>  -->
                                    </div>
                                      <p v-if="!editFormationIsValid  && firstSubmit" class="error-message2"> Vous devez renseigner une formation pour ce profil</p>
                                    <!-- /////////////////////////PLUGIN MULTISELECT FORMATION  //////////////////// -->

                               
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Mot de passe</label>
                                        <div class="col-md-8">
                                            <input v-model="teacherEdited.password" type="text" class="form-control" id="passwordprofEdit" placeholder="Mot de passe">
                                            <!-- <p v-if="!passwordIsValid" class="error-message"> Vous devez créer un mot de passe pour ce profil</p> -->
                                            <span v-if="teacherEdited.password">
                                            <p  class="error-message" v-for="error in editPasswordValidation.errors" :key="error" >=>{{error}} </p> 
                                            </span>
                                        </div>
                                        <div class="col-md-2">
                                            <button @click="generatePassword('edit')" id="aleatoire" class="btn btn-default btn-success aleatoire">Aléatoire</button>
                                        </div>
                                    </div>

                                     <div class="form-group">
                                        <label class="col-md-2 control-label">Confirmer Mot de passe</label>
                                        <div class="col-md-8">
                                            <input v-model="teacherEdited.passwordConfirm" type="password" class="form-control" id="passwordconfirm-edit" placeholder="Confirmez le mot de passe">
                                            <!-- <p v-if="!passwordIsValid" class="error-message"> Vous devez créer un mot de passe pour ce profil</p> -->
                                            <p v-if="!editPasswordConfirmIsValid  && teacherEdited.passwordConfirm" class="error-message"> Les mots de passe ne sont pas identiques.</p>
                                        </div>
            
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 control-label">Remarque</label>
                                        <div class="col-md-10">
                                            <textarea v-model="teacherEdited.note" class="form-control" id="note" placeholder="Ajoutez une note spéciale concernant ce profil"></textarea>
                                        </div>
                                    </div>
                                </div>

                    </div>
                    <div class="modal-footer">
                          <button data-dismiss="modal" :disabled="!editFormIsValid  && firstSubmit" @click="editerProfesseur" type="submit" value="Submit" class="btn btn-default btn-success">Modifier</button>
                        <!-- <button data-dismiss="modal" v-bind:disabled="isDisabled" @click="savePassword" type="submit" class="btn btn-default btn-success">Modifier</button> -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>


<script>

require('../../css/todolist.scss');
    
    import moment from 'moment'
    import $ from 'jquery'
    import Vue2Filters from 'vue2-filters'
    import Multiselect from 'vue-multiselect'
    import popupNotification from './notification/popupNotification.vue'
    import  FvlDatePicker  from './directeurcomponents/FvlDatePicker.vue'
    import { FvlForm } from 'formvuelar'
    import flatpickr from "flatpickr";
    import { mapGetters, mapMutations, mapActions, mapState } from 'vuex';

    export default {
        
        mixins: [Vue2Filters.mixin], // utilisé pour affiché par ordre alphabétique les professeurs avec  doc https://github.com/freearhey/vue2-filters
        components: {
            Multiselect, // Utilisation de multi select plugin
            popupNotification,
            FvlForm,
            FvlDatePicker
        },
        data: function () {
            return {
                form: {
                    date: null,
                    daterange: null,
                    range: {
                        start: '',
                        end: ''
                    },
                    time: null,
                    datetime: null
                },
                datePickerSource:
                    `<fvl-date-picker \n` +
                    `   :value.sync="form.date" \n` +
                    `   name="startdate"\n` +
                    `   label="Select a date"\n` +
                    `   placeholder="Select a date"\n` +
                `/>\n`,
                sessionSelectedValue: [],
                sessionOptions: [],
                formationSelectedValue: [],
                formationSelectedOptions: [],
                isLoading: false,
                professeurs: {},
                newProfesseur: {},
                professeurDeleteId:{}, 
                teacherEdited: {},
                emailsListe:[],
                errored: false,
                errorsForm: [],
                errorFormDataBase: false,
                specialChars: "<>@!#$%^&*()_+[]{}?:;|'\"\\,./~`-=",
                submitted:false,
                firstSubmit:false,
                editMailFind: false,
                mailFind:false,
                rules: [
                    { message:'Un caractère spécial est requis ex :(!@#$%^&).', regex:/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/ },
                    { message:"Une majuscule est requise.",  regex:/[A-Z]+/ },
                    { message:"votre mot de passe doit avoir au minimum 8 caractères.", regex:/.{8,}/ },
                    { message:"Au moins un chiffre est requis.", regex:/[0-9]+/ }
                ],
            }
        },
       
        created() {
            this.updateLoader(true)
            fetch('/superadmin/data/enseignants', { method: 'GET' })
            .then(res => res.json()) // expecting a json response
            .then(data => {
                this.professeurs = data;
                console.log(data)
                }).catch(err => console.error(err))
            .finally(() => this.updateLoader(false));
    
        },
        
        computed: {
            ...mapState(['GlobalLoading']),
            genreIsValid(){
                  if (this.newProfesseur.genre) {
                    return true
                } else {
                    return false
                }
            },

            PasswordConfirmIsValid() {
                if (this.newProfesseur.password == this.newProfesseur.passwordConfirm) {
                    return true
                } else {
                    return false
                }
            },
            passwordValidation() {
                let errors = []
                for (let condition of this.rules) {
                    if (!condition.regex.test( this.newProfesseur.password)) {
                        errors.push(condition.message)
                    }
                }
                if (errors.length === 0) {
                    return { passwordIsValid:true, errors }
                } else {
                    return { passwordIsValid:false, errors }
                }
            },
            isDisabled(){
                return this.professeurs.titre === '';
            },
        
            firstNameIsValid(){
              
                var chiffre = /[0-9]+/
                var specialChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/
             
                // var taille=
                if ( typeof this.newProfesseur.firstName ==='string'  && this.newProfesseur.firstName.length >2  && !specialChar.test( this.newProfesseur.firstName) && !chiffre.test( this.newProfesseur.firstName) ){
                    return { formIsValid:true} // créera une variable nommée formIsValid dans this.firstNameIsValid qui deviendra un tableau !
                }
                else {
                    return { formIsValid:false}
                }
          
            },

            lastNameIsValid(){
                var chiffre = /[0-9]+/
                var specialChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/
                // var taille=
                if ( typeof this.newProfesseur.lastName ==='string'  && this.newProfesseur.lastName.length >1  && !specialChar.test( this.newProfesseur.lastName) && !chiffre.test( this.newProfesseur.lastName) ){
                    return { formIsValid:true} 
                }
                else {
                    return { formIsValid:false}
                }
        
            },

            emailIsValid(){
                var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                   this.mailFind=false; // initial
                if(this.newProfesseur.email && this.emailsListe){
                    
                    for (let profil of this.emailsListe) {
                        
                        var mail = this.newProfesseur.email.toLowerCase()
                        if (profil.email == mail) {
                            this.mailFind=true;
                        }
                    }
                }
                else{this.mailFind=false;}
                if(re.test(this.newProfesseur.email) && this.newProfesseur.email.length >4 && this.mailFind ==true ){
                    return { emailExist:true,emailForm: true}
                }
                else if (re.test(this.newProfesseur.email) && this.newProfesseur.email.length >4 && this.mailFind == false) {
                    return { emailExist:false,emailForm: true}
                }
                return { emailExist:false,emailForm: false};
          
            },
            datebirthIsValid (){
                console.log('type of datebirth : ' + typeof this.form.date);
                return this.form.date !== null 
            },
            sessionIsValid(){
                if(this.sessionSelectedValue.length>0){
                    this.newProfesseur.session = this.sessionSelectedValue
                   return this.newProfesseur.session
                }
            },
              formationIsValid(){
                if(this.formationSelectedValue.length>0){
                   return this.formationSelectedValue
                }
            },
              usernameIsValid(){
                var letter = /[a-zA-Z]+/
                var chiffre = /[0-9]+/
                var specialChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/
                return typeof this.newProfesseur.username ==='string'  && this.newProfesseur.username.length >1 && letter.test(this.newProfesseur.username)
            },
            
        
            formIsValid(){
                return this.firstNameIsValid.formIsValid && this.genreIsValid && this.lastNameIsValid.formIsValid && !this.emailIsValid.emailExist 
                && this.emailIsValid.emailForm && this.formationIsValid && this.sessionIsValid && this.usernameIsValid 
                && this.passwordValidation.passwordIsValid && this.PasswordConfirmIsValid && this.datebirthIsValid
            },
            editFormIsValid(){
                return this.editEmailIsValid.emailForm  && !this.editEmailIsValid.emailExist && this.editFormationIsValid && this.editSessionIsValid && this.editUsernameIsValid 
                && this.editPasswordValidation.passwordIsValid && this.editPasswordConfirmIsValid 
            },
            

             editEmailIsValid() {
                var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                   this.editMailFind=false; // initial
                if(this.teacherEdited.email && this.emailsListe){
                    
                    for (let profil of this.emailsListe) {
                        
                        var mail = this.teacherEdited.email.toLowerCase()
                        if (profil.email == mail &&  profil.id !== this.teacherEdited.id) {
                            this.editMailFind=true;
                        }
                    }
                }
                else{this.editMailFind=false;}
                if(re.test(this.teacherEdited.email) && this.teacherEdited.email.length >4 && this.editMailFind ==true ){
                    return { emailExist:true,emailForm: true}
                }
                else if (re.test(this.teacherEdited.email) && this.teacherEdited.email.length >4 && this.editMailFind == false) {
                    return { emailExist:false,emailForm: true}
                }
                return false;
          
            },

            
            editSessionIsValid(){
                if(this.sessionSelectedValue.length>0){
                    this.teacherEdited.session = this.sessionSelectedValue
                   return this.teacherEdited.session 
                }
            },
              editFormationIsValid(){
                if(this.formationSelectedValue.length>0){
                   return this.formationSelectedValue
                }
            },
              editUsernameIsValid(){
                var letter = /[a-zA-Z]+/
                var chiffre = /[0-9]+/
                var specialChar = /[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+/
                return typeof this.teacherEdited.username ==='string'  && this.teacherEdited.username.length >1 && letter.test(this.teacherEdited.username)
            },

             editPasswordConfirmIsValid() {
                if (this.teacherEdited.password == this.teacherEdited.passwordConfirm) {
                    return true
                } else {
                    return false
                }
            },
            editPasswordValidation() {
                let errors = []
                for (let condition of this.rules) {
                    if (!condition.regex.test( this.teacherEdited.password)) {
                        errors.push(condition.message)
                    }
                }
                if (errors.length === 0) {
                    return { passwordIsValid:true, errors }
                } else {
                    return { passwordIsValid:false, errors }
                }
            },
           
        },
        methods: {
            ...mapActions(['updateLoader']),

            updateFormationChoix(){
                let arrayformation = new Array()
                if(!(this.sessionSelectedValue.length === 0)){
                this.sessionSelectedValue.forEach(function (session) {
                    session.formations.forEach(function (formation){
                       
                        if( formation.title.indexOf(session.entitled)=== -1){ // on évite la boucle sans fin 
                            formation.title = formation.title +' ('+ session.entitled+')';
                        }    
                            arrayformation.push(formation)
                    })
                   
                })
                this.formationSelectedOptions= arrayformation // un tableau intermediare
                 }
                 else if((this.sessionSelectedValue.length === 0)){
                    console.log('Suppression option formation ');
                    this.formationSelectedOptions= [];
                    this.formationSelectedValue=[];
                 }
                 
            },
             formateDate(value){
                var date = moment(value.timestamp * 1000).format("DD-MM-YYYY")
                return date
            },

            /**
             * Enregistrement d'un nouveau professeur
             */
            AjouterProfesseur(){
                this.updateLoader(true)
                this.firstSubmit = true
                if(this.formIsValid || this.firstSubmit && this.formIsValid ){

                    let email = this.newProfesseur.email
                    let firstName = this.newProfesseur.firstName

                    this.errorFormDataBase = false
                    const user = {
                        email: this.newProfesseur.email,
                        genre: this.newProfesseur.genre,
                        firstName: this.newProfesseur.firstName,
                        lastName: this.newProfesseur.lastName,
                        datebirth: this.form.date,
                        username: this.newProfesseur.username,
                        password: this.newProfesseur.password,
                        formations: this.formationSelectedValue,
                        sessionId: this.sessionSelectedValue,
                        note: this.newProfesseur.note
                    };
                    const options = {
                        method: 'POST',
                        body: JSON.stringify(user),
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    }

                    fetch('/superadmin/data/enseignants/new', options)
                    .then(res => res.json()) // expecting a json response
                    .then(data => {
                        console.log('Professeur ajouté !!')
                        this.professeurs.push(data)
                        this.sessionSelectedValue=[];
                        //Reinit form
                        let titre = 'Validation de l\'ajout du Profil'
                        let message=' le profil enseignant de '+this.newProfesseur.firstName+' '+this.newProfesseur.lastName+ ' a bien été enregistré ! '
                        this.$refs.popupNotification.validNotification(titre,message);
                        this.razNewProfesseur()
                    }).catch(err => {
                        this.errorFormDataBase = true 
                        this.updateLoader(false) // Vuex
                        console.log('Il y a eu un problème avec l\'opération fetch: ' + err.message)
                    })
                    .finally(() => {
                        this.updateLoader(false)
                        this.sendEmailConfirm(email, firstName)
                    });
                }
                else{
                    this.updateLoader(false)
                    this.$refs.popupNotification.errorNotification("Certains champs mal remplis !", "Vous devez correctement renseigner les champs avant de pouvoir envoyer le formulaire.");
                }
                
            },

            sendEmailConfirm(email, firstName){
                const user = {
                        email: email,
                        firstName: firstName,
                    };
                const options = {
                        method: 'POST',
                        body: JSON.stringify(user),
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    }
                fetch('/sendEmailConfirm/', options)      
                .then(data => {
                    // function (response) {
                    console.log('response de requette :'+ data.ok)
                    if(data.ok) {
                    //On supprime le mot de passe du tableau
                        console.log('message de confirmation envoyé');
                    } 
                }) 
                .catch(function(error) {
                console.log('Il y a eu un problème avec l\'opération fetch: ' + error.message);
                })
                .finally(() => {
                        let titre = 'Validation de l\'envoi du mail de confirmation'
                        let message=' l\'email de confirmation de création du profil enseignant de '+ firstName + ' a bien été envoyé ! '
                        this.$refs.popupNotification.validNotification(titre,message);// Lance une methode du meme nom sur un composant enfant !
                        console.log('message envoyé')
                    });
            },

            searchInList(){        
                //Gère la barre de recherche avec Jquery
                $(document).ready(function(){
                    $("#tableSearch").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    $("#list tr").filter(function() {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                    });
                });
            },
            getAllEmails(){
                //Recuperation des emails dans la BD  pour verification
                fetch('/getemails', { method: 'GET' })
                .then(res => res.json()) // expecting a json response
                .then(data => {
                    this.emailsListe = data;
                    console.log('On recupère la liste des emails ');
                }).catch(err => console.error(err))
            },

            miseAjourFormulaire(){
                //Recuperation des données par la BD sur la liste des session et aussi des modules pour metre a jour le champ de selection dans le formulaire.
                fetch('/getsessions', { method: 'GET' })
                .then(res => res.json()) // expecting a json response
                .then(data => {
                    this.sessionOptions = data;
                    console.log('Dans res.data on recupere les données des session ');
                }).catch(err => {console.error(err)
                    this.errored = true
                })
    
            },
     
            // Affiche la différence de temps en jour pour le moment depuis l'inscription (A mettre à jour en ajoutant heure mois année)
            calculInterval: function (value) {
                if (!value) return '';
                let todaysDate = moment(new Date());
                let oDate = moment(new Date(value.timestamp * 1000));
                if(todaysDate.diff(oDate, 'years') > 0){
                    return 'Il y a '+(todaysDate.diff(oDate, 'years') + ' ans.');
                }
                else if (todaysDate.diff(oDate, 'months') > 0){
                    return 'Il y a '+(todaysDate.diff(oDate, 'months') + ' mois.');
                }
                else if (todaysDate.diff(oDate, 'days') > 0){
                    return 'Il y a ' +(todaysDate.diff(oDate, 'days') + ' jours.');
                }
                else if (todaysDate.diff(oDate, 'hours') > 0){
                    return 'Il y a ' +(todaysDate.diff(oDate, 'hours') + ' heure.');
                }

                 else if (todaysDate.diff(oDate, 'minutes') > 0){
                    return 'Il y a ' +(todaysDate.diff(oDate, 'minutes') + ' minutes.');
                }
                else{
                    return 'Il y a ' +(todaysDate.diff(oDate, 'seconds') + ' secondes.');
                }
                
                



                // var now  = "01/08/2016 15:00:00";
                // var then = "04/02/2016 14:20:30";
                // var diff = moment.duration(todaysDate.diff(oDate));
                // return diff;
                
                

            },
            isExpired(value) {
                if (this.calculInterval(value) > 300) {
                    return true;
                } else {
                    return false;
                }
                ;
            },
            

            /**
             * Edit motdepasse
             */
            editTeacher(item) {
                this.sessionSelectedValue = item.session
                this.formationSelectedValue = item.formation
                this.updateFormationChoix()
                this.teacherEdited = item 
            },

             /**
             * supprimer un profil
             */
            deleteProf(item) {
                this.professeurDeleteId = item
            },

            /**
             * Remise à 0 du formulaire d'edition
             */
            razEditedPassword(){
                this.firstSubmit=false
                this.newProfesseur.email=''
                this.teacherEdited = {}
                this.sessionSelectedValue = []
                this.formationSelectedValue = []
            },

            /**
             * Remise à 0 du formulaire d'edition
             */
            razNewProfesseur(){
                this.firstSubmit=false
                this.newProfesseur.email=''
                this.newProfesseur = {} // newProfesseur se vide lors de la fermeture de la modal ou de l'envoi du formulaire 
                this.sessionSelectedValue=[];
                this.formationSelectedValue=[];
            },

            /**
             *  editer le profil professeur
             */
            editerProfesseur() {
                this.updateLoader(true) // active le loader CSS via Vuex
                this.firstSubmit = true
                if(this.editFormIsValid || this.firstSubmit && this.editFormIsValid ){
                    this.errorFormDataBase = false
                     
                    const user = {
                        email: this.teacherEdited.email,
                        username: this.teacherEdited.username,
                        password: this.teacherEdited.password,
                        formations: this.formationSelectedValue,
                        sessions: this.sessionSelectedValue,
                        note: this.teacherEdited.note
                    };
                    const options = {
                        method: 'POST',
                        body: JSON.stringify(user),
                        headers: {
                            'Content-Type': 'application/json'
                        }
                    }

                    fetch('/edit/teacher/' + parseInt(this.teacherEdited.id), options)
                    .then(res => res.json()) // expecting a json response
                    .then(data => {
                         console.log('Teacher modifié!!')
                        let idChanged = this.teacherEdited.id;
                        this.professeurs.forEach(function (element) {
                            if (element.id === idChanged) {
                                element.email = data.email;
                                element.username = data.username;
                                element.professeur.session = Object.values(data.professeur.session); // on veut un tableau et on recois un objet (pour le v-for dans le template)
                                element.professeur.formation = Object.values(data.professeur.formation);
                                element.professeur.matter = data.professeur.matter;
                               
                            }
                        });
                        //Reinit form
                        let titre = 'Validation de l\'ajout du Profil'
                        let message=' le profil enseignant de '+this.teacherEdited.firstName+' '+this.teacherEdited.lastName+ ' a bien mis à jour ! '
                        this.$refs.popupNotification.validNotification(titre,message);// Lance une methode du meme nom sur un composant enfant !
                        this.razEditedPassword()
                        this.sessionSelectedValue=[];
                    }).catch(err => {
                        this.errorFormDataBase = true // s'active si le formulaire est mal rempli
                        this.updateLoader(false)
                        console.log('Il y a eu un problème avec l\'opération fetch: ' + err.message)
                    })
                    .finally(() => this.updateLoader(false));
                }
                else{
                    this.updateLoader(false)
                    this.$refs.popupNotification.errorNotification("Certains champs mal remplis !", "Vous devez correctement renseigner les champs avant de pouvoir envoyer le formulaire."); 
                }         
            },

            /**
             * Génération d'un mot de passe aleatoire
             */
            generatePassword(action) {
                
                fetch('/motdepasse/generate', { method: 'GET' })
                .then(res => res.json()) // expecting a json response
                .then(data => {
                    if (action === 'edit') {
                        this.$set(this.teacherEdited,'password',data);
                    } else {
                        this.$set(this.newProfesseur, 'password',data);
                    }
                }).catch(err => {console.error(err)
                    this.errored = true
                })
            },

            /**
             * Suppression d'un professeur
             */
            deleteTeacher(id) {
                fetch('/teacher/delete/' + parseInt(id), { method: 'GET' })      
                .then(data => {
                    // function (response) {
                    console.log('response de requette :'+ data.ok)
                    if(data.ok) {
                    //On supprime le mot de passe du tableau
                        let idDeleted = id;
                        let cpt = 0;
                        let rowASupprimer = -1;
                        this.professeurs.forEach(function (element) {
                            if (element.id === idDeleted) {
                                rowASupprimer = cpt;
                            }
                            cpt++;
                        });
                        if (rowASupprimer > -1) {
                            this.professeurs.splice(rowASupprimer, 1);
                        }
                    } 
                }) 
                .catch(function(error) {
                console.log('Il y a eu un problème avec l\'opération fetch: ' + error.message);
                })
            }
        },
    }
</script>
<style src="vue-multiselect/dist/vue-multiselect.min.css"> /* utilise le plugin multi  select */

</style> 