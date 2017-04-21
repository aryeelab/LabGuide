# Adding modules to be imported
Quick guide how to add modules to rgs13

### Make 'non-standard' modulefiles available by add the following lines to .bashrc:

```
module use /apps/modulefiles/lab
module use /apps/modulefiles/test
```
(These may already be in your `.bashrc` file; this includes our own lab modules as well as 'testing' modules installed by the HPC administrators.)

### Creating modules for custom software:

- Install software in the following directory: 
```
/apps/lab/aryee/
```

- Then create a modulefile under the following location: 
```
/apps/modulefiles/lab/aryee/
```

- Here is a simple example you can copy/edit:
```
/apps/modulefiles/lab/aryee/bwtool
```

- Use your new module:
```
module load aryee/[YOUR_NEW_MODULE]
```

- Or better yet, add it to your `.bashrc`:
```
echo "module load aryee/[YOUR_NEW_MODULE]" >> $HOME/.bashrc
```
