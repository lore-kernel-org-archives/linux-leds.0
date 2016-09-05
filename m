From: Raul Piper <raulpblooper@gmail.com>
Subject: Creating sysfs brightness for every led channels
Date: Mon, 5 Sep 2016 23:57:35 +0530
Message-ID: <CAEwN+MAZZW3aoohYUyeUySZFkytz_vUsKwzxaG3aK8AA5UZUpg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7308622231108091351=="
Return-path: <kernelnewbies-bounces@kernelnewbies.org>
List-Unsubscribe: <https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies>,
	<mailto:kernelnewbies-request@kernelnewbies.org?subject=unsubscribe>
List-Archive: <http://lists.kernelnewbies.org/pipermail/kernelnewbies>
List-Post: <mailto:kernelnewbies@kernelnewbies.org>
List-Help: <mailto:kernelnewbies-request@kernelnewbies.org?subject=help>
List-Subscribe: <https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies>,
	<mailto:kernelnewbies-request@kernelnewbies.org?subject=subscribe>
Sender: kernelnewbies-bounces@kernelnewbies.org
Errors-To: kernelnewbies-bounces@kernelnewbies.org
To: linux-leds@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
List-Id: linux-leds@vger.kernel.org

--===============7308622231108091351==
Content-Type: multipart/alternative; boundary=001a114b80548ef76d053bc6d592

--001a114b80548ef76d053bc6d592
Content-Type: text/plain; charset=UTF-8

Hi,
I am trying to send the brightness value ( for 5 channels) by
 echo "val1val2val3val4val5" > brightness ,
But seems like even if I change the brightness type to enum or int in my
driver ,I will never be able to send the brightness string because led
class defines the brightness value as enum.

*extern void led_set_brightness(struct led_classdev *led_cdev,
enum led_brightness brightness);*

Only possible way I am finding is to create attributes for each channel
like brightness,default trigger,max_brightness and any user defined
attributes, but i am not getting how to do this.
Can some on please comment or post the link to the example driver.
Do i have to call led_class_register for every channel and I have to
 define every channel in the device tree?
Thanks in advance !
Regards,
Rp

--001a114b80548ef76d053bc6d592
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div>I am trying to send the brightness value ( f=
or 5 channels) by=C2=A0</div><div>=C2=A0echo &quot;val1val2val3val4val5&quo=
t; &gt; brightness ,=C2=A0</div><div>But seems like even if I change the br=
ightness type to enum or int in my driver ,I will never be able to send the=
 brightness string because led class defines the brightness value as enum.<=
/div><div><pre style=3D"padding:1em;overflow:auto"><font color=3D"#787878" =
face=3D"monaco, courier new, courier, monospace"><span style=3D"font-size:1=
2.35px"><b>extern void led_set_brightness(struct led_classdev *led_cdev,
enum led_brightness brightness);</b></span><span style=3D"font-size:0.95em"=
><b><br></b></span></font></pre></div><div>Only possible way I am finding i=
s to create attributes for each channel like brightness,default trigger,max=
_brightness and any user defined attributes, but i am not getting how to do=
 this.</div><div>Can some on please comment or post the link to the example=
 driver.</div><div>Do i have to call led_class_register for every channel a=
nd I have to =C2=A0define every channel in the device tree?</div><div>Thank=
s in advance !</div><div>Regards,</div><div>Rp</div></div>

--001a114b80548ef76d053bc6d592--


--===============7308622231108091351==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernelnewbies mailing list
Kernelnewbies@kernelnewbies.org
https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies

--===============7308622231108091351==--
