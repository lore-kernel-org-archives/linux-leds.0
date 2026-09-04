Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0931A4418EC
	for <linux-leds@vger.kernel.org>; Fri,  4 Sep 2026 12:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525295; cv=none; b=ZE3bp95WLCFCP/O+5ryyrF+u2Z4JenB3ZkokzNhQr534q4M+KpQBUqO77CS0sSYdf3z8k7HC0s3SII/romvZi2LN15WJIGOGnHZuQAyZlT7lNQFOrADzMe03mmImaBxBVLymSlt/QnnIG4B7EJDs1Kmcf9kK+xmIqFc8iICM/sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525295; c=relaxed/simple;
	bh=OkKHBCTPV/8d3wnFlD3oMLKdSOwnU5/WsULg3IfE4K8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WFlihZ4nh1Vg/P9ula/bhK9bznbvedXN1OCc2cOJ2EPj6gFFhF4UqUKp4vguY5x40Hki5HDhMIkybLpW7c/WPqsAZ1Drqy3Qo8ZSupGRpsnYB4JP6nIMQs6nA2OaglOa4KHlXBsCfte8uQcyskd/pq9X9t/afbFu/tMa1RMK28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJXZWwiw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJXZWwiw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C52F1F00A3D;
	Fri,  4 Sep 2026 12:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788525293;
	bh=0wbhIu2MnlNnnhM8Fbrj35DNRtLSL7ZGnD8zNw2xwiU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OJXZWwiwNsuC4cDAatpicQXk+BH6wCe3S/OL07Ak4kiRvNs6T5HOQqP/VIYcQT4p2
	 hFNGJvD93byfQCIB074HlORpesjZoU/HfPJTojmW0YyxbiWPqBCIDmSxn9YkPMCMDa
	 dUcj2LNqqbBpzOmkW8fyvfkZGeh5Aer83x4EpUI2IJ+tSx7ohgM7UM4JAZ6h077YRl
	 y7cgQfC5lmChb+NjlFgImoIYiRDs0F1ytNRh7LQhOyFipqyrXdn5BBNOjSek6XMPDv
	 LRGVdwHl0x4s5lPU2cINbqgyZHD4m140BYM8ri88WXon8/4u/NrtKzc6zk43lTF5rP
	 bHyTk4gTtjd9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: fix typo "retrive" in comment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hemanth Selam" <hemanth.selam@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <20260904122738.33145-1-hemanth.selam@gmail.com>
References: <20260904122738.33145-1-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 12:34:52 +0000
Message-Id: <20260904123453.6C52F1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] The commit message fails to follow the LED subsystem guidelines for=
 prefix format and capitalization.

Pre-existing issues:
- [High] If pci_register_driver() does not bind a device (e.g., due to node=
tect=3D1 on a system without the hardware), nas_gpio_pci_dev remains NULL, =
causing an invalid pointer dereference during LED registration.
- [High] The driver registers LEDs globally during module init rather than =
in probe, and fails to unregister them upon device removal, violating subsy=
stem rules and leading to use-after-release bugs.
--

commit 933a15295df77c1222bb18879d12d9d6414867f1
Author: Hemanth Selam <hemanth.selam@gmail.com>

leds: fix typo "retrive" in comment

Correct "retrive" to "retrieve", reported by scripts/checkpatch.pl using
the misspelling list in scripts/spelling.txt. Only touches comments, no
code changes.

> leds: fix typo "retrive" in comment

[Severity: Low]
Does this commit message violate the LED subsystem conventions? According to
the subsystem guidelines, the prefix format should be
leds: <Driver>: <Capitalized description>, but this subject omits the driver
name and does not capitalize the description.


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
>  static int ich7_lpc_probe(struct pci_dev *dev,

[Severity: High]
This is a pre-existing issue, but if pci_register_driver() does not bind a
device (for example, due to nodetect=3D1 on a system without the hardware),
ich7_lpc_probe() is never called and nas_gpio_pci_dev remains NULL.

Can this cause an invalid pointer dereference during LED registration?

drivers/leds/leds-ss4200.c:nas_gpio_init() {
    ...
	ret =3D pci_register_driver(&nas_gpio_pci_driver);
	if (ret)
		return ret;
	for (i =3D 0; i < ARRAY_SIZE(nasgpio_leds); i++) {
		ret =3D register_nasgpio_led(i);
    ...
}

drivers/leds/leds-ss4200.c:register_nasgpio_led() {
    ...
	return led_classdev_register(&nas_gpio_pci_dev->dev, led);
}

Passing &nas_gpio_pci_dev->dev yields an offset pointer from NULL, which wi=
ll
be dereferenced by the driver core.


[Severity: High]
This is a pre-existing issue, but the driver registers LEDs globally during
module initialization, decoupled from the PCI device lifecycle.

Can this lead to a use-after-release issue?

When the PCI device is unbound via sysfs, ich7_lpc_remove() is called:

drivers/leds/leds-ss4200.c:ich7_lpc_remove() {
	ich7_lpc_cleanup(&dev->dev);
	pci_disable_device(dev);
}

This releases the I/O region and disables the PCI device, but fails to
unregister the globally registered LEDs. A privileged user could interact w=
ith
dangling LED sysfs nodes that access the released I/O ports.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904122738.3314=
5-1-hemanth.selam@gmail.com?part=3D1
