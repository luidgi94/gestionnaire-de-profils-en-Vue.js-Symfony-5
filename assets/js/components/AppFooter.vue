<template>
    <footer class="footer">
        <div class="container">
            
            <div class="row align-items-center justify-content-md-between">
                <div class="col-md-6">
                    <div class="copyright text-light">
                        &copy; {{year}}
                        <a href="https://www.creative-tim.com" class="text-light" target="_blank" rel="noopener">Codesk</a> & <a href="https://www.binarcode.com" class="text-light" target="_blank" rel="noopener">CO</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <ul class="nav nav-footer justify-content-end">
                        <li class="nav-item">
                            <a href="https://www.creative-tim.com" class="nav-link text-light" target="_blank" rel="noopener">Codesk</a>
                        </li>
                        <li class="nav-item">
                            <a href="https://www.creative-tim.com/presentation" class="nav-link text-light" target="_blank" rel="noopener">À propos
                                de nous</a>
                        </li>
                        <li class="nav-item">
                            <a href="http://blog.creative-tim.com" class="nav-link text-light" target="_blank" rel="noopener">Blog</a>
                        </li>
                        <li class="nav-item">
                            <a href="https://github.com/creativetimofficial/argon-design-system/blob/master/LICENSE.md"
                               class="nav-link text-light" target="_blank" rel="noopener">MIT License</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
</template>
<script>
export default {
  name: 'app-footer',
  data() {
    return {
      year: new Date().getFullYear()
    }
  }
};
</script>
