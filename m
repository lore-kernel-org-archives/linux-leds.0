Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692C843B6DD;
	Wed, 29 Jul 2026 07:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785311463; cv=none; b=dS10TwqCXyNQOUbSCVKkHEKxbVQqZDBKEP7DgJ+u0cZF/R2K/VdEz8aFULl5XalXkMIMMdQhmMQJg4xxg881TFhKZJ2iHa8m3KKCs9oEbsQkRo/P1VKNsOuhFU/bbFNE8V7bchr0uVzhCX7LXJUOE9rfIpONVUyHvB6h58vO/3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785311463; c=relaxed/simple;
	bh=+9N/3HUhPZr6Y0AnQ/0s4O8kliwj/6ewRRsCM5EuCwo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OB3LO1wxMhQXuEE0nrdv1S9fhwWEw6hRRcdNjkH4Xsf/WVPBqkNAdXunR4YJ4OsDQR8uHq7owfecEZ9DCnWRGBnQ4nKLxqpazUl5kgh+cY1+dgkOFugNhAU4jwWLGwbaaXyKyEYNp4w6d7jD4CepvUYAwuSQVwWpdCWHDbnLZts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqQKn9jH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqQKn9jH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED70A1F00A3D;
	Wed, 29 Jul 2026 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785311456;
	bh=tlD91KNtE50GnDMk3TE9IVovFMjNuBOF2RHx+XCyows=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EqQKn9jHclr/49ZPeisFCs4SSv5m3Ke7miG2z0ZuwXV3wCNM9ORFWBAYT7y41bNmU
	 2CYnSLS1FdFs+N8CwndzrSY/DEdAuLZVN0IRvs3hy6htk/xsQJP1VeCYJ5w0zf5Jq/
	 vImugkIXLtlaIZ2Pd0Azdu4o/q2OjnaKcKZzmjwvfNy0exFHSem6TBHdeAfmn5j5/Y
	 buosvSxVv42v+D+0pCTLG5x+P5bePuMSf7Da36idc/z7SoxV7TDXluK6ZZkjLvqK94
	 xe8ZDnf9hmswDdH6ZkMoN5MUkdmPSBvNCkqzW0nQwA71r37zMiZULIO/pSoSBpF1/5
	 05ZO5eHQ+HJ+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] leds: pca9532: fix use-after-free on unbind with
 N2100 beeper
Reply-To: sashiko-reviews@lists.linux.dev
To: haibo.chen@oss.nxp.com
Cc: imx@lists.linux.dev, linux-leds@vger.kernel.org, lee@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260729-led-fix-v2-4-09ad218457bd@nxp.com>
References: <20260729-led-fix-v2-0-09ad218457bd@nxp.com>
 <20260729-led-fix-v2-4-09ad218457bd@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 07:50:55 +0000
Message-Id: <20260729075055.ED70A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Explicitly calling `input_unregister_device()` on a device allocat=
ed via `devm_input_allocate_device()` violates input subsystem managed reso=
urce integration guidelines.
- [Low] The commit message description is not capitalized.

Pre-existing issues:
- [High] Unprotected read and write access to shared driver state (`data->p=
wm`, `data->psc`, and `led->state`) leads to data races between concurrent =
LED operations and input events.
- [High] `pca9532_probe` uses `BUG_ON(data->idev)` which allows malformed d=
evice tree data to panic the kernel.
--

--- Patch [4]: [PATCH v2 4/4] leds: pca9532: fix use-after-free on unbind w=
ith N2100 beeper ---
commit cbc774be651cc4a48a4aeff9054da59aafa6a737
Author: Haibo Chen <haibo.chen@nxp.com>
leds: pca9532: fix use-after-free on unbind with N2100 beeper

The commit attempts to fix a use-after-free during device unbind by explici=
tly
unregistering the input device before cancelling the workqueue. This preven=
ts
new events from requeuing the work after it has been cancelled but before t=
he
devm cleanup runs.

> leds: pca9532: fix use-after-free on unbind with N2100 beeper

[Severity: Low]
This isn't a bug, but the subsystem guidelines request that the description
after the prefix is capitalized. Should this be "Fix use-after-free..."?

> diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
> index cee398d8275b8..eeb91b7466419 100644
> --- a/drivers/leds/leds-pca9532.c
> +++ b/drivers/leds/leds-pca9532.c
> @@ -385,6 +385,12 @@ static void pca9532_destroy_devices(struct pca9532_d=
ata *data, int n_devs)
>  			break;
>  		case PCA9532_TYPE_N2100_BEEP:
>  			if (data->idev !=3D NULL) {
> +				/*
> +				 * Unregister the input device first so that no
> +				 * new EV_SND events can re-queue the work after
> +				 * it has been cancelled.
> +				 */
> +				input_unregister_device(data->idev);

[Severity: High]
Does explicitly unregistering a device allocated with
devm_input_allocate_device() violate the managed resource integration
guidelines?

The input subsystem documentation states that explicitly calling
input_unregister_device() on a device allocated via
devm_input_allocate_device() can lead to double-unregistration.

Would it be safer to register a managed action using devm_add_action_or_res=
et()
to cancel the workqueue before calling input_register_device()? Since devres
executes actions in LIFO order, this would guarantee the input device is
cleanly unregistered before the workqueue is automatically canceled.

>  				cancel_work_sync(&data->work);
>  				data->idev =3D NULL;
>  			}

[Severity: High]
This is a pre-existing issue, but can concurrent access to the shared driver
state lead to data corruption of I2C hardware state?

The input event handler pca9532_event() can locklessly modify data->pwm:

pca9532_event() {
    ...
    data->pwm[PCA9532_PWM_ID_1] =3D 127;
}

Concurrently, pca9532_update_hw_blink() can be called from sysfs to set a
blink rate, which also modifies data->pwm locklessly:

pca9532_update_hw_blink() {
    ...
    data->psc[PCA9532_PWM_ID_1] =3D psc;
    data->pwm[PCA9532_PWM_ID_1] =3D (delay_on * PCA9532_PWM_DUTY_DIV) /
                                  (delay_on + delay_off);
}

Additionally, pca9532_set_brightness() reads led->state locklessly in
pca9532_calcpwm(). Could this data race lead to incorrect LED brightness or
blink rates when userspace triggers sysfs writes and input events at the
same time?

[Severity: High]
This is a pre-existing issue, but does pca9532_probe() allow malformed devi=
ce
tree data to panic the kernel?

If a device tree contains more than one LED node configured as
PCA9532_TYPE_N2100_BEEP, the first iteration successfully allocates and
registers data->idev. The second iteration reaches pca9532_configure() and =
hits:

pca9532_configure() {
    ...
    BUG_ON(data->idev);
}

Should the driver log an error and return -EINVAL instead of triggering a
kernel panic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-led-fix-v2=
-0-09ad218457bd@nxp.com?part=3D4
