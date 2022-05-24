# Frequently Asked Questions


<details><summary>  <b>1)</b> I am following the steps in generating the docker development image in R; however, it seems the volume is not synchronized between the docker container and my host machine. Do you have any idea? </summary>
<p>

This question is related to {ref}`setting_rep_env`. The problem can happen in case of using different username and volume mount path. Make sure that the 3 shown user are the same values.

```s
docker run -it --rm \
        -p 8787:8787 \
        -e USER= --> user <-- \
        -e PASSWORD=password \
        -v "[Path to Project A on your system]:/home/ --> user <-- /Project_A" \
        -v "[Path to cache on your system]:/home/ -->user <-- /cache" rvers

```

</p>
</details>

***********

<details><summary>  <b>2)</b> Trying to load the package using <span style="background-color: #FDD3D0"> devtools::load_all() </span>, however, received <span style="background-color: #FDD3D0"> Error in dyn.load(dll_copy_file) : unable to load shared object, invalid ELF header </span>.  </summary>
<p>

This is mainly happens because the new docker container (possibliy run on Ubuntu) trying to use `.dll` cache file that is generated with other system. To resolve this issue, run the following command:

```r
devtools::clean_dll()
```

</p>
</details>