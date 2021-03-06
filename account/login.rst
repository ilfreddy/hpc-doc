.. _login:

=============================
Logging in for the first time
=============================


Log in with SSH
===============
An *SSH* client (Secure SHell) is the required tool to connect to Stallo. An *SSH* client provides secure encrypted communications between two hosts over an insecure network.

If you already have *ssh* installed on your UNIX-like system, have a user account and password on a Notur system, login may be as easy as typing

::

 ssh <machine name>         (for instance: ssh njord.hpc.ntnu.no)

into a terminal window.

If your user name on the machine differs from your user name on the local machine, use the -l option to specify the user name on the machine to which you connect. For example:

::

 ssh <machine name> -l [user name]

And if you need X-forwarding (for instance, if you like to run Emacs in it's own window) you must log in like this:

::

 ssh -X -Y <machine name>

Log in with an ssh-key
----------------------

.. FIXME: short explanation about using ssh keys

SSH clients for Windows and Mac
-------------------------------
At the `OpenSSH page <http://www.openssh.com>`_ you will find several *SSH* alternatives for both Windows and Mac.

Please note that Mac OS X comes with its own implementation of *OpenSSH*, so you don't need to install any third-party software to take advantage of the extra security *SSH* offers. Just open a terminal window and jump in.


Learning more about SSH
-----------------------
To learn more about using SSH, please also consult the `OpenSSH page <http://www.openssh.com>`_ page and take a look at the manual page on your system (*man ssh*).



Obtain a new password
=====================
When you have been granted an account on stallo.uit.no, your username and password is sent to you separately.
The username by email and the password by SMS. The password you receive by SMS is temporally and only valid for 7 days. 


The passwd command does not seem to work. My password is reset back to the old one after a while. Why is this happening?
------------------------------------------------------------------------------------------------------------------------

The Stallo system is using a centralised database for user management.
This will override the password changes done locally on Stallo.

The password can be changed `here <https://www.metacenter.no/user/password/>`_, log in using your
username on stallo and the NOTUR domain.


Logging on the compute nodes
============================

Information on how to log in on a compute node.

Some times you may want to log on a compute node (for instance to check
out output files on the local work area on the node), and this is also
done by using SSH. From stallo.uit.no you can log in to
compute-x-y the following way:

::

    ssh -Y compute-x-y     (for instance: ssh compute-5-8)

or short

::

    ssh -Y cx-y        (for instance: ssh c5-8)

If you don't need display forwarding you can omit the "-Y" option
above.

If you for instance want to run a program interactively on a compute
node, and with display forwarding to your desktop you should in stead do
something like this:

#. first login to Stallo with display forwarding,
#. then you should reserve a node through the
   queuing system

Below is an example on how you can do this:

::

    1) Log in on Stallo with display forwarding.  

       $ ssh -Y stallo.uit.no                       
    
    2) Reserve and log in on a compute node with display forwarding.
       (start an interactive job.)

       $ srun srun -N 1 -t 1:0:0 --pty bash -i
    
    3) Open a new terminal window, type squeue -j <jobid> (it shows you which node(s) was allocated 
       to that specific job). Then ssh -Y <nodename> to that node and start your preferred gui.


Graphical logon to Stallo
=========================

If you want to run applications with graphical user interfaces we recommend you to use the
`remote desktop service <http://stallo-gui.uit.no/vnc/>`_
on Stallo. 

If you have a new account and you have never logged in on Stallo before, first log in with a classical ssh connection (see above). Afterwards you can use the graphical logon. Otherwise it can happen that your /home will not be created and you will get an error message of the type: "Could not chdir to home directory /home/your_user_name: No such file or directory"

**Important:**
 
If you are connecting from outside the networks of UNINETT and partners you need to log into 
stallo-gui.uit.no with ssh to verify that you have a valid username and password on the Stallo system.
After a successful login the service will automatically allow you to connect from the ip-address 
your client currently has. The connection will be open for at least 5 minutes after you log in. 
There is no need to keep the ssh-connection open after you have connected to the remote desktop, 
in fact you will be automatically logged off after 5 seconds.
