ANSIBLE DEMO

1) First connect to the Oracle Cloud Instance.

        ssh opc@129.154.33.166 -i C:/Users/User/Downloads/Key2
    
2) Navigate to the /etc/ansible/hosts file and add the ssh connection information for the client instance within a collection.

        [ansible_clients]
        129.154.37.8 ansible_user=ubuntu ansible_pass= ansible_ssh_private_key_file=~/.ssh/mykey1.pem 
   
     #ansible_user = username /n 
     #ansible_pass = password (null here because no password) /n 
     #ansible_ssh_private_key_file = location of the ssh private key for the client instance /n 
       
3) create a sample playbook for the configurations that should be done to the client collection in the host inventory.

    #inside >> vi sample.yml

        ---
        - name: sample book
          hosts: ansible_clients
          remote_user: ubuntu
          become: true
          tasks:
           - name: "apt-get update"
             apt:
               update_cache: yes
               cache_valid_time: 3600

           - name: "install nginx"
             apt:
               name: ['nginx']
               state: latest

           - name: "create www directory"
             file:
               path: /var/www/temp
               state: directory
               mode: '0775'
               owner: "ubuntu"
               group: "ubuntu"

          - name: delete default nginx site
            file:
              path: /etc/nginx/sites-enabled/default
              state: absent
            notify: restart nginx

          - name: copy nginx site.conf
            template:
              src: site.conf.j2
              dest: /etc/nginx/sites-enabled/{{ domain }}
              owner: root
              group: root
              mode: '0644'
            notify: restart nginx

          handlers:
            - name: restart nginx
              service:
                name: nginx
                state: restarted
