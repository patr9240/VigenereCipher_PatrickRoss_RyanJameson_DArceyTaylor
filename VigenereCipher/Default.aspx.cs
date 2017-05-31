using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VigenereCipher
{
    public partial class _Default : Page
    {
        char[] alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();

        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void SubmitButton_Click1(object sender, EventArgs e)
        {
            string message = MessageTextBox.Text;
            string key = EncryptionKeyTextBox.Text;
            string result = "";
            int rotModifier = 0;

            if (ROT0.Checked)
            {
                rotModifier = 0;
            }
            else if (ROT1.Checked)
            {
                rotModifier = 1;
            }

            int keyIndex = 0;

            message = message.ToUpper();
            key = key.ToUpper();

            Char[] messageArray = message.ToCharArray();
            Char[] keyArray = key.ToCharArray();

            //Encrypts message
            if (Encrypt.Checked)
            {
                for (int i = 0; i < message.Length; i++)
                {
                    char messageChar = messageArray[i];
                    if (messageChar < 'A' || messageChar > 'Z')
                    {
                        continue;
                    }
                    
                    int index = Array.IndexOf(alpha, messageChar);
                    int rotValue = Array.IndexOf(alpha, keyArray[keyIndex]) + rotModifier;

                    if (index + rotValue >= alpha.Length)
                    {
                        int remainder = alpha.Length - index;
                        result += alpha[rotValue - remainder];
                    }

                    else
                    {
                        result += alpha[index + rotValue];
                    }

                    keyIndex = ++keyIndex % key.Length;
                }
                FinalMessageLabel.Text = "Encrypted message:";
                FinalMessageTextBox.Text = result;
            }

            //Decrypts message
            if (Decrypt.Checked)
            {
                for (int i = 0; i < message.Length; i++)
                {
                    char messageChar = messageArray[i];
                    if (messageChar < 'A' || messageChar > 'Z')
                    {
                        continue;
                    }

                    int index = Array.IndexOf(alpha, messageChar);
                    int rotValue = Array.IndexOf(alpha, keyArray[keyIndex]) + rotModifier;

                    if (index - rotValue < 0)
                    {
                        int remainder = rotValue - index;
                        result += alpha[alpha.Length - remainder];
                    }

                    else
                    {
                        result += alpha[index - rotValue];
                    }

                    keyIndex = ++keyIndex % key.Length;
                }
                FinalMessageLabel.Text = "Decrypted message:";
                FinalMessageTextBox.Text = result;
            }
        }
    }
}