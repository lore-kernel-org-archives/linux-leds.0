From: Simon Guinot <simon.guinot@sequanux.org>
Subject: Re: [PATCH] leds: leds-netxbig.c: Use devm_led_classdev_register
Date: Wed, 21 Oct 2015 10:05:47 +0200
Message-ID: <20151021080546.GC6540@kw.sim.vm.gnt>
References: <1445371592-24228-1-git-send-email-fmthoker@gmail.com>
 <5627382C.4040207@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5627382C.4040207@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Fida Mohammad <fmthoker@gmail.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Muhammad Falak <falakreyaz@gmail.com>, Simon Guinot <sguinot@lacie.com>
List-Id: linux-leds@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2015 at 09:01:00AM +0200, Jacek Anaszewski wrote:
> Hi Fida,
>=20
> On 10/20/2015 10:06 PM, Fida Mohammad wrote:
> >Use resource managed function devm_led_classdev_register to make
> >error path simpler. Consequently, removed a goto call and
> >remove function made simpler.
> >
> >Signed-off-by: Fida Mohammad <fmthoker@gmail.com>
> >---
> >  drivers/leds/leds-netxbig.c | 25 +++++--------------------
> >  1 file changed, 5 insertions(+), 20 deletions(-)
> >
> >diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
> >index 25e4197..639f8bd 100644
> >--- a/drivers/leds/leds-netxbig.c
> >+++ b/drivers/leds/leds-netxbig.c
> >@@ -299,10 +299,6 @@ static struct attribute *netxbig_led_attrs[] =3D {
> >  };
> >  ATTRIBUTE_GROUPS(netxbig_led);
> >
> >-static void delete_netxbig_led(struct netxbig_led_data *led_dat)
> >-{
> >-	led_classdev_unregister(&led_dat->cdev);
> >-}
> >
> >  static int
> >  create_netxbig_led(struct platform_device *pdev,
> >@@ -343,7 +339,7 @@ create_netxbig_led(struct platform_device *pdev,
> >  	if (led_dat->mode_val[NETXBIG_LED_SATA] !=3D NETXBIG_LED_INVALID_MODE)
> >  		led_dat->cdev.groups =3D netxbig_led_groups;
> >
> >-	return led_classdev_register(&pdev->dev, &led_dat->cdev);
> >+	return devm_led_classdev_register(&pdev->dev, &led_dat->cdev);
> >  }
> >
> >  static int netxbig_led_probe(struct platform_device *pdev)
> >@@ -367,32 +363,21 @@ static int netxbig_led_probe(struct platform_devic=
e *pdev)
> >
> >  	for (i =3D 0; i < pdata->num_leds; i++) {
> >  		ret =3D create_netxbig_led(pdev, &leds_data[i], &pdata->leds[i]);
> >-		if (ret < 0)
> >-			goto err_free_leds;
> >+		if (ret < 0) {
> >+			gpio_ext_free(pdata->gpio_ext);
> >+			return ret;
> >+		}
> >  	}
> >
> >  	platform_set_drvdata(pdev, leds_data);
> >
> >  	return 0;
> >
> >-err_free_leds:
> >-	for (i =3D i - 1; i >=3D 0; i--)
> >-		delete_netxbig_led(&leds_data[i]);
> >-
> >-	gpio_ext_free(pdata->gpio_ext);
> >-	return ret;
> >  }
> >
> >  static int netxbig_led_remove(struct platform_device *pdev)
> >  {
> >  	struct netxbig_led_platform_data *pdata =3D dev_get_platdata(&pdev->d=
ev);
> >-	struct netxbig_led_data *leds_data;
> >-	int i;
> >-
> >-	leds_data =3D platform_get_drvdata(pdev);
> >-
> >-	for (i =3D 0; i < pdata->num_leds; i++)
> >-		delete_netxbig_led(&leds_data[i]);
> >
> >  	gpio_ext_free(pdata->gpio_ext);
> >
> >
>=20
> Thanks for the patch.
>=20
> Always when submitting patches please cc also the author.
> I know that this is a simple optimization, but nevertheless
> an ack from the author, who can test the patch on the hardware,
> is valuable. Cc Simon.

Hi Fida and Jacek,

An extended version of this patch (with also the devm_gpio_ conversion)
is already sitting in the LED's for-next branch.

deae3c1895c234e17dafea57b0d4ce4d5da16559
leds: netxbig: convert to use the devm_ functions

Thanks,

Simon

--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlYnR1oACgkQgtp0PDeOcDpZbgCdEAW9HnVxq6AgSUSskMTn92F1
jB8AnRUJ9WtRoLA+C6+eKVKWAgbxB496
=z6bO
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
