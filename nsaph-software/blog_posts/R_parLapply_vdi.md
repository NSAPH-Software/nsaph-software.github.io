# Estimating PI on FASRC server node

This section presents steps to run a shared-memory parallel job on a virtual desktop at FASRC.

## Access to the System

You need to have an account to have access to VDI and any other FASRC computational resources. Please see the following link for more details.

- [How Do I Get a FAS Research Computing Account?](https://docs.rc.fas.harvard.edu/kb/how-do-i-get-a-research-computing-account/)

If you are working from out of campus, you also need to set up a VPN. Please see the following link for more details.

- [VPN Setup](https://docs.rc.fas.harvard.edu/kb/vpn-setup/)

## Submit a Request for Remote Desktop

If you have an account and you are on a VPN (in case of working from out of campus), this step is straight forward.

- Step 1: Go to the following link and log in.

https://vdi.rc.fas.harvard.edu/pun/sys/dashboard/batch_connect/sessions

This will open the following page.

```{figure} ../figures/png/vdi_1.png
---
width: 480px
name: vdi_1
```


- Step 2: Click on FAS-RC Remote Desktop

```{figure} ../figures/png/vdi_2.png
---
width: 480px
name: vdi_2
```

- Step 3: Select required number of cores and Memory

Each remote desktop will be on one server node. If you do not request all cores on that node, your node may be shared with other users. Requesting all cores and memory on one node will affect your fairshare. Sharing the node with other users will not affect your job. Please read more in the following link:

[Fairshare and Job Accounting](https://docs.rc.fas.harvard.edu/kb/fairshare/)

```{figure} ../figures/png/vdi_3.png
---
width: 480px
name: vdi_3
```

- Step 4: Launch the Request

Click on the Launch button.

```{figure} ../figures/png/vdi_4.png
---
width: 480px
name: vdi_4
```

- Step 5: Wait until your session is started.

The waiting time will be related to other users' requests and your fairshare. 

```{figure} ../figures/png/vdi_5.png
---
width: 480px
name: vdi_5
```

- Step 6: Launch the Remote Desktop

Click on `FAS-RC Remote Desktop`.

```{figure} ../figures/png/vdi_6.png
---
width: 480px
name: vdi_6
```

After clicking the button, a new tab will be opened on the browser, and you will have access to the remote desktop.  

```{figure} ../figures/png/vdi_7.png
---
width: 480px
name: vdi_7
```

## Set up R environment

Open a terminal and load an R module. 

```s
module load R/4.1.0-fasrc01
```

You can find different builds for R in the following link. (Type R in the search bar)

- https://portal.rc.fas.harvard.edu/p3/build-reports/


## Transfer your files to VDI

VDI has access to your home directory and your lab scratch directory (if you have any). Create a folder and transfer your files into that folder. You can directly copy, use `scp`, use `rsync`, or use `Git`.

## Run the code

You can run an R code from the terminal using the following two options. In the terminal that you have already loaded R:

- Use `Rscript` command
  - In this approach, you just need to type 
  ```s
  Rscript --vanilla your_R_code.R
  ```
- User interactive R
  - Type `R`, and it will open an R session in the terminal. 
  - Use `source(your_R_code.R)`

## Monitor the runs

You can monitor the CPU activity and memory usage by using the `htop` command. Open another terminal window and type `htop` hit enter. To deactivate `htop` you can use `esc` button.

The following figure shows running the problem with 48 cores. 

```{figure} ../figures/png/vdi_8.png
---
width: 480px
name: vdi_8
```

## Questions?

If you have any questions, please read the documentation.

- https://docs.rc.fas.harvard.edu/

If you cannot find an answer or you need further help, please submit a ticket.

- https://portal.rc.fas.harvard.edu/login/?next=/rcrt/submit_ticket