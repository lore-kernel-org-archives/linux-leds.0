Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ED0356766
	for <linux-leds@vger.kernel.org>; Mon,  7 Sep 2026 05:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788757345; cv=none; b=CTc/d8uildMTEsPH9CfQqY3ktAJ+f3cRVHVmJCTcu3dZhF8ucusxtAdk0dJk4tCcQHBbg7NH3J4Fc/6kCucD5PWczepQ5l9CmGzzmq2ZhL0FSR+B2XYsCyTVmslJMORTEVUzCWRUibr5OawXihg+cIx2SuH8Bx/q70lqFGOGCgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788757345; c=relaxed/simple;
	bh=YL2KSPt44o9QqyAJ5LZsgWLJGbzd+7ixpZZ62Cx5VSk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mxi+CX4Ao1nIAKiPhqbk8cz0Gz334ylHbE5UJKVJTiaz6cEHijtV59C8UBfVBU4moQwTi1uMZX4BHHLa1XRJg2fqLvRq4KkcUgyulWz+fTvIr4xnTO1+TOgXqSrWolsTLrLffPJ4+oxfXwvVYWojvuriobjnWMK4wpmsHa20POs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cS6T/q/M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cS6T/q/M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595B61F00A3A;
	Mon,  7 Sep 2026 05:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788757343;
	bh=menesgl/3BlR9rmabMCHYX8wghUV/SujSZfjvgCaGSw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cS6T/q/MN5wm028VFp7qSbozTYb2XAxowZ4l18+uWz0jKE7wHPDIbyzEXTe3PYRwe
	 4gLx84zHWYlQkDqPV0SIisNUKoh7lLXuV+eL12bHZpJRhh+VSpAvYxMxNIohc9myjs
	 w0IElxZj+g0f9Aq5En42fnTs3ExtGSr/0wp9LLEV9lo+RA6+9xb634qKKgnimF+vQY
	 HqVe2cZG9sbUEV/AgMxUKz+Yje5vZx/3QmfFlqxO526hzpNNnqvRssFtpNRaBhAtI5
	 jauNCoCwCEKGKUMcXlKDjqOWYEcxXE7Gw2+HPK2IUpvgfBL3Xt3Zh2x3Jz6cb8ijzH
	 PEOMd8K+hWrlQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: ss4200: Fix typo "retrive" in comment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20260907045436.18039-1-hemanth.selam@gmail.com>
References: <20260907045436.18039-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 05:02:22 +0000
Message-Id: <20260907050223.595B61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Dereference of uninitialized `nas_gpio_pci_dev` pointer when the d=
river loads but the PCI device is not probed.
- [High] LED class devices are not unregistered when the PCI device is remo=
ved, leading to I/O corruption and dangling sysfs entries.
- [High] The global `nas_gpio_pci_dev` pointer is left dangling if `ich7_lp=
c_probe` fails.
--

commit ec2db960d9ab8126ad72c0997e1828fad4669f6b
Author: Hemanth Selam <hemanth.selam@gmail.com>

leds: ss4200: Fix typo "retrive" in comment

This commit fixes a typo in a comment from "retrive" to "retrieve" as
reported by checkpatch.pl.

> diff --git a/drivers/leds/leds-ss4200.c b/drivers/leds/leds-ss4200.c
> index fcaa34706b6ca..1b08a40961ba4 100644
> --- a/drivers/leds/leds-ss4200.c
> +++ b/drivers/leds/leds-ss4200.c
> @@ -339,7 +339,7 @@ static void ich7_lpc_cleanup(struct device *dev)
> =20
>  /*
>   * The OS has determined that the LPC of the Intel ICH7 Southbridge is p=
resent
> - * so we can retrive the required operational information and prepare th=
e GPIO.
> + * so we can retrieve the required operational information and prepare t=
he GPIO.
>   */
>  static struct pci_dev *nas_gpio_pci_dev;

[Severity: High]
This isn't a bug introduced by this patch, but does this code leave the
nas_gpio_pci_dev pointer dangling if probe fails?

In ich7_lpc_probe():

	nas_gpio_pci_dev =3D dev;
	status =3D pci_read_config_dword(dev, PMBASE, &g_pm_io_base);
	if (status)
		goto out;

    ...

out:
	if (status) {
		ich7_lpc_cleanup(&dev->dev);
		pci_disable_device(dev);
	}
	return status;

If initialization fails (e.g. request_region() failure), it jumps to the out
label and returns an error without clearing nas_gpio_pci_dev.

[Severity: High]
This is a pre-existing issue, but can this dereference an uninitialized or
invalid pointer on module load?

In nas_gpio_init():

	ret =3D pci_register_driver(&nas_gpio_pci_driver);
	if (ret)
		return ret;
	for (i =3D 0; i < ARRAY_SIZE(nasgpio_leds); i++) {
		ret =3D register_nasgpio_led(i);

And register_nasgpio_led() unconditionally uses the global pointer:

	return led_classdev_register(&nas_gpio_pci_dev->dev, led);

Since pci_register_driver() returns 0 on successful registration with the P=
CI
core regardless of whether a device was found or successfully probed,
nas_gpio_pci_dev could be NULL (if no hardware bound) or an invalid pointer
(if probe failed), leading to a kernel panic upon dereference.

[Severity: High]
This is a pre-existing issue, but does ich7_lpc_remove() fail to unregister
the active LEDs?

static void ich7_lpc_remove(struct pci_dev *dev)
{
	ich7_lpc_cleanup(&dev->dev);
	pci_disable_device(dev);
}

When the PCI device is removed via sysfs unbind, this function releases the
I/O resources but leaves the LEDs registered. If a user subsequently access=
es
the LED sysfs entries, it will trigger I/O port accesses to the released
region, potentially corrupting state if another driver has claimed it.

>  static int ich7_lpc_probe(struct pci_dev *dev,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907045436.1803=
9-1-hemanth.selam@gmail.com?part=3D1
