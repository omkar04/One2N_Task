** Part 1 Http_Services**

Step 1 :- Install Python and pip
          pip install flask boto3

step2 :- AWS S3 Bucket
             Create an S3 bucket named testbucket9207 in the ap-south-1 region
             Granted the necessary permissions for your application to list and read its contents for bucket.
             ![image](https://github.com/user-attachments/assets/bdef1fcf-e183-46ee-aa08-2e069d7fc9a6)

step 3 :- IAM Role
              set up an IAM role configured credentials in local - aws configure
              provided appropriate permissions to access the bucket.
              ![image](https://github.com/user-attachments/assets/2e21fe65-51f1-4f27-8fe9-8fd017827358)
step 4 :- Run the application using python app.py
          ![image](https://github.com/user-attachments/assets/27d288f0-8e21-47e1-a0bb-77c9dec10b4d)
          Code is provided in http_service.py.
          Below are the images on the output :-
         Homepage :-
         
![image](https://github.com/user-attachments/assets/992df22c-f8e0-4219-bf8f-bf4b5f59436f)

          
Listing dir in buckets:-
         
![image](https://github.com/user-attachments/assets/f117baa1-a602-4830-86f1-28cc642581f2)

          
Dir 1 path :- 
   
![image](https://github.com/user-attachments/assets/b1eb897f-75e2-4e7a-a07e-19a039547dbe)
 
          
Dir 2 path :-
 
![image](https://github.com/user-attachments/assets/52dc3098-014c-45fe-ae44-1527da9297ee)

          
If the wrong dir path provided Error handled as :- 
       
![image](https://github.com/user-attachments/assets/0f5d15c5-5250-40e1-8b91-714333b4cca6)


====================< End of part 1 >==========================

**Part 2 Terraform layout to provision infrastructure on AWS and deploy the above code.**
Step 1 :- Install Python and pip
          pip install flask boto3

step2 :- AWS S3 Bucket
             Create an S3 bucket named testbucket9207 in the ap-south-1 region
             Granted the necessary permissions for your application to list and read its contents for bucket.
             ![image](https://github.com/user-attachments/assets/bdef1fcf-e183-46ee-aa08-2e069d7fc9a6)

step 3 :- IAM Role
              set up an IAM role configured credentials in local - aws configure
              provided appropriate permissions to access the bucket.
              ![image](https://github.com/user-attachments/assets/2e21fe65-51f1-4f27-8fe9-8fd017827358)

step 4 :- Using Terraform commmand execute the code
             Terraform plan (Everything looks good go with apply)
             Terraform apply
             ![image](https://github.com/user-attachments/assets/76a658db-56e5-4ff8-a9bb-caee51b86640)
             ![image](https://github.com/user-attachments/assets/157df5ad-9ca8-4a64-a4bc-1034e522bea6)
            
             
             
homepage :-

![image](https://github.com/user-attachments/assets/a3d22986-085c-42ad-b567-a310255a3ac0)

             
listing the dir in s3:- 

             
![image](https://github.com/user-attachments/assets/600227f1-72a0-4750-ad14-46518e06cdb4)

             
Dir1 path :-

![image](https://github.com/user-attachments/assets/c5361637-710f-4f76-a50b-95b64ec1ef8d)
           
             
Dir2 path :- 
            
![image](https://github.com/user-attachments/assets/ac5c0b31-bee6-4c58-ac99-defa08de8758)
            Tf main code is in main.tf file and varialbles and creds are fetched through variables.tf


             


 


 
