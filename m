From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv3 0/2] Driver for TI tlc59116 16 Channel i2c LED driver
Date: Fri, 16 Jan 2015 16:52:12 +0200
Message-ID: <54B9259C.3070403@ti.com>
References: <1421277308-3477-1-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8853549839746532684=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1421277308-3477-1-git-send-email-andrew@lunn.ch>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andrew Lunn <andrew@lunn.ch>, cooloney@gmail.com, rpurdie@rpsys.net, "R, Vignesh" <vigneshr@ti.com>
Cc: devicetree@vger.kernel.org, Matthew.Fatheree@belkin.com, Sekhar Nori <nsekhar@ti.com>, linux-leds@vger.kernel.org, kaloz@openwrt.org, linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-leds@vger.kernel.org

--===============8853549839746532684==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="bcO34vuBmAaiXnqpLeMhxaBXshVE5kfmK"

--bcO34vuBmAaiXnqpLeMhxaBXshVE5kfmK
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi,

On 15/01/15 01:15, Andrew Lunn wrote:
> This patchset is a driver for the TI tlc59116 16 Channel i2c LED
> driver. This driver is used on the Belkin WRT1900AC access point and
> the C code is derived from code Belkin contributed to OpenWRT.
> However it has been extensively re-written, and a device tree binding
> added to replace platform data.

We have a TLC59108 on one of our boards, and with a quick glance it
looks about the same as TLC59116, except the amount of outputs. Vignesh
wrote a driver for it and was about to send it for review.

However, Vignesh implemented it as a PWM driver. We use it for LCD
backlight (via pwm-backlight).

I'm not very familiar with LED and PWM drivers, but doesn't implementing
this as a LED driver prevent us from using it as a backlight? Whereas it
looks like PWM can be used as a led via pwm-leds (I think).

 Tomi



--bcO34vuBmAaiXnqpLeMhxaBXshVE5kfmK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUuSWcAAoJEPo9qoy8lh71o5sP/2mqBR5/g26ZDkvLMVqMW+Nu
HsQKZ/UQKiszQ91f5W5bMarmH8JK1yQir6PNivgLrogtj+xFfsAGimn2jRhaTthf
FfZXo0pHo57eGrVciZlQu/e/av8sWqr6k3+uM1ds/3UmQUHNBqcahkXXMj2IZtn2
BDSvkFB9S0kPKM+FRD0eQXmib620s3t3310ef8OQVaGHmhR1Wz5gsi86uYfGKonq
4z3hmx6JFHkOgAwOPfOCHPbKmltTQM3Lm8tlNMi8LNE5h+xvTWH7sqSLNP6QQV5R
MhYRg8vhKiXbuUnQHUai4VoQ/f5XizhNrN6Oscb+g9Yyt1f6wJiHSQLvSm1T8Hpf
wm7yo1WoR1qcG+kLnpZcnmWHJoxfaiJY3k7VRqLnVEw9xr5ftnTm4ajlw7ewbK8v
bZVyIPONkwn/j+peExsTZ7ku9tDA9/vK7Dk8sD5uLfiHSb3nSDdtutS+sXcfPNwp
SwMW7ffQiV68AIEPRGoRiIHuZ2dpQvlNvi480uwPY3SHxA4zYkfkYhFd19mVM7F1
gZHgTS/JsaP19BhSL9eVSFUKt1osqeywcWk6xv7NpmqF8MNfHwdaUzE2JH7gdSrT
gn5ffHn9KMgmJaxMhgrw1ui/DklT9gErJLiAsGnp3eeheI0O3sMiYjJyzEJSFaPJ
rMoY4/pQcxHvwzJI1TqA
=VxTc
-----END PGP SIGNATURE-----

--bcO34vuBmAaiXnqpLeMhxaBXshVE5kfmK--


--===============8853549839746532684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8853549839746532684==--
