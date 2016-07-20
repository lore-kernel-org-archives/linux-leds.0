From: Anish Kumar <anish198519851985@gmail.com>
Subject: Re: gpio-led driver
Date: Wed, 20 Jul 2016 08:00:00 -0700
Message-ID: <7B4F09F2-45F9-4E6F-81A5-955E6B1B4980@gmail.com>
References: <CAEwN+MA=hFvqhBsuzo2XJWgqeO6h7L126Z+YRfOZxPmdn=afCw@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Type: multipart/mixed; boundary="===============6371932866900305855=="
Return-path: <kernelnewbies-bounces@kernelnewbies.org>
In-Reply-To: <CAEwN+MA=hFvqhBsuzo2XJWgqeO6h7L126Z+YRfOZxPmdn=afCw@mail.gmail.com>
List-Unsubscribe: <https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies>,
	<mailto:kernelnewbies-request@kernelnewbies.org?subject=unsubscribe>
List-Archive: <http://lists.kernelnewbies.org/pipermail/kernelnewbies>
List-Post: <mailto:kernelnewbies@kernelnewbies.org>
List-Help: <mailto:kernelnewbies-request@kernelnewbies.org?subject=help>
List-Subscribe: <https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies>,
	<mailto:kernelnewbies-request@kernelnewbies.org?subject=subscribe>
Sender: kernelnewbies-bounces@kernelnewbies.org
Errors-To: kernelnewbies-bounces@kernelnewbies.org
To: Raul Piper <raulpblooper@gmail.com>
Cc: linux-leds@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
List-Id: linux-leds@vger.kernel.org


--===============6371932866900305855==
Content-Type: multipart/alternative;
	boundary=Apple-Mail-8E644315-9906-4FAE-A643-7C7E4C48154B
Content-Transfer-Encoding: 7bit


--Apple-Mail-8E644315-9906-4FAE-A643-7C7E4C48154B
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On Jul 20, 2016, at 4:15 AM, Raul Piper <raulpblooper@gmail.com> wrote:
>=20
> Hi,
> I wanted to know the part number

What is part number?

> for the leds-gpio.c in the driver/leds folder and the device tree bindings=
 for this driver .Can some one point out to me where in Linux kernel it is?
>=20
> Also why below line has been used.Is it mandatory?
> ...
> .of_match_table =3D of_gpio_leds_match,

This is needed when you are using device tree for getting the board settings=
 but you can also do the same without this as well. Read up on device tree i=
n kernel Documentation folder.
> },
>=20
> thanks in advance ,
> Rp
> _______________________________________________
> Kernelnewbies mailing list
> Kernelnewbies@kernelnewbies.org
> https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies

--Apple-Mail-8E644315-9906-4FAE-A643-7C7E4C48154B
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div></div><div><br></div><div><br>On Jul 2=
0, 2016, at 4:15 AM, Raul Piper &lt;<a href=3D"mailto:raulpblooper@gmail.com=
">raulpblooper@gmail.com</a>&gt; wrote:<br><br></div><blockquote type=3D"cit=
e"><div><div dir=3D"ltr"><span style=3D"font-size:12.8px">Hi,</span><div><sp=
an style=3D"font-size:12.8px">I wanted to know the part number </span></div>=
</div></div></blockquote><div><br></div><div>What is part number?</div><br><=
blockquote type=3D"cite"><div><div dir=3D"ltr"><div><span style=3D"font-size=
:12.8px">for the leds-gpio.c in the driver/leds folder and the&nbsp;device t=
ree bindings&nbsp;for this driver .Can some one point out to me where in Lin=
ux kernel it is?</span><br style=3D"font-size:12.8px"><br style=3D"font-size=
:12.8px"><span style=3D"font-size:12.8px">Also why below line has been used.=
Is it mandatory?</span><br style=3D"font-size:12.8px"><span style=3D"font-si=
ze:12.8px">...</span><br style=3D"font-size:12.8px"><b style=3D"font-size:12=
.8px">.of_match_table =3D of_gpio_leds_match,</b><br style=3D"font-size:12.8=
px"></div></div></div></blockquote><div><br></div>This is needed when you ar=
e using device tree for getting the board settings but you can also do the s=
ame without this as well. Read up on device tree in kernel Documentation fol=
der.<br><blockquote type=3D"cite"><div><div dir=3D"ltr"><div><span style=3D"=
font-size:12.8px">},</span><br><div><span style=3D"font-size:12.8px"><br></s=
pan></div><div><span style=3D"font-size:12.8px">thanks in advance ,</span></=
div><div><span style=3D"font-size:12.8px">Rp</span></div></div></div>
</div></blockquote><blockquote type=3D"cite"><div><span>____________________=
___________________________</span><br><span>Kernelnewbies mailing list</span=
><br><span><a href=3D"mailto:Kernelnewbies@kernelnewbies.org">Kernelnewbies@=
kernelnewbies.org</a></span><br><span><a href=3D"https://lists.kernelnewbies=
.org/mailman/listinfo/kernelnewbies">https://lists.kernelnewbies.org/mailman=
/listinfo/kernelnewbies</a></span><br></div></blockquote></body></html>=

--Apple-Mail-8E644315-9906-4FAE-A643-7C7E4C48154B--


--===============6371932866900305855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernelnewbies mailing list
Kernelnewbies@kernelnewbies.org
https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies

--===============6371932866900305855==--
