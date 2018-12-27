From: Pavel Machek <pavel@ucw.cz>
Subject: leds/lm3642: simplify error handling, remove user-triggerable errors
Date: Thu, 27 Dec 2018 20:55:52 +0100
Message-ID: <20181227195552.GB12008@amd>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org


--vGgW1X5XWziG23Ko
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Doing goto just to return is unneccessarily complex, simplify code a
bit.

Drop dev_err()s that can be triggered by user.

   =20
Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/drivers/leds/leds-lm3642.c b/drivers/leds/leds-lm3642.c
index cada084..62fc752 100644
--- a/drivers/leds/leds-lm3642.c
+++ b/drivers/leds/leds-lm3642.c
@@ -110,7 +110,7 @@ static int lm3642_control(struct lm3642_chip_data *chip,
 	ret =3D regmap_read(chip->regmap, REG_FLAG, &chip->last_flag);
 	if (ret < 0) {
 		dev_err(chip->dev, "Failed to read REG_FLAG Register\n");
-		goto out;
+		return ret;
 	}
=20
 	if (chip->last_flag)
@@ -150,11 +150,11 @@ static int lm3642_control(struct lm3642_chip_data *ch=
ip,
 		break;
=20
 	default:
-		return ret;
+		return -EINVAL;
 	}
 	if (ret < 0) {
 		dev_err(chip->dev, "Failed to write REG_I_CTRL Register\n");
-		goto out;
+		return ret;
 	}
=20
 	if (chip->tx_pin)
@@ -163,13 +163,12 @@ static int lm3642_control(struct lm3642_chip_data *ch=
ip,
 	ret =3D regmap_update_bits(chip->regmap, REG_ENABLE,
 				 MODE_BITS_MASK << MODE_BITS_SHIFT,
 				 opmode << MODE_BITS_SHIFT);
-out:
 	return ret;
 }
=20
 /* torch */
=20
-/* torch pin config for lm3642*/
+/* torch pin config for lm3642 */
 static ssize_t lm3642_torch_pin_store(struct device *dev,
 				      struct device_attribute *attr,
 				      const char *buf, size_t size)
@@ -182,7 +181,7 @@ static ssize_t lm3642_torch_pin_store(struct device *de=
v,
=20
 	ret =3D kstrtouint(buf, 10, &state);
 	if (ret)
-		goto out_strtoint;
+		return ret;
 	if (state !=3D 0)
 		state =3D 0x01 << TORCH_PIN_EN_SHIFT;
=20
@@ -190,16 +189,12 @@ static ssize_t lm3642_torch_pin_store(struct device *=
dev,
 	ret =3D regmap_update_bits(chip->regmap, REG_ENABLE,
 				 TORCH_PIN_EN_MASK << TORCH_PIN_EN_SHIFT,
 				 state);
-	if (ret < 0)
-		goto out;
+	if (ret < 0) {
+		dev_err(chip->dev, "%s:i2c access fail to register\n", __func__);
+		return ret;
+	}
=20
 	return size;
-out:
-	dev_err(chip->dev, "%s:i2c access fail to register\n", __func__);
-	return ret;
-out_strtoint:
-	dev_err(chip->dev, "%s: fail to change str to int\n", __func__);
-	return ret;
 }
=20
 static DEVICE_ATTR(torch_pin, S_IWUSR, NULL, lm3642_torch_pin_store);
@@ -233,7 +228,7 @@ static ssize_t lm3642_strobe_pin_store(struct device *d=
ev,
=20
 	ret =3D kstrtouint(buf, 10, &state);
 	if (ret)
-		goto out_strtoint;
+		return ret;
 	if (state !=3D 0)
 		state =3D 0x01 << STROBE_PIN_EN_SHIFT;
=20
@@ -241,16 +236,12 @@ static ssize_t lm3642_strobe_pin_store(struct device =
*dev,
 	ret =3D regmap_update_bits(chip->regmap, REG_ENABLE,
 				 STROBE_PIN_EN_MASK << STROBE_PIN_EN_SHIFT,
 				 state);
-	if (ret < 0)
-		goto out;
+	if (ret < 0) {
+		dev_err(chip->dev, "%s:i2c access fail to register\n", __func__);
+		return ret;
+	}
=20
 	return size;
-out:
-	dev_err(chip->dev, "%s:i2c access fail to register\n", __func__);
-	return ret;
-out_strtoint:
-	dev_err(chip->dev, "%s: fail to change str to int\n", __func__);
-	return ret;
 }
=20
 static DEVICE_ATTR(strobe_pin, S_IWUSR, NULL, lm3642_strobe_pin_store);

--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlwlLkgACgkQMOfwapXb+vICRwCgpVbhHJLOtKvwzizn7W/nzSrQ
IgIAoI+S3v0lcb6Woq4G20Uhajrh6OWz
=LzCi
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
