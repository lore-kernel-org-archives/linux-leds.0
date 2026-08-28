Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACEB93F12C2
	for <linux-leds@vger.kernel.org>; Fri, 28 Aug 2026 08:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907559; cv=none; b=S1BKzDhNkuDTKI6KITJtSGMm3hSl29yyTGtg7NXsYNyMB+JexnXQ+JOt6qT3n/BPrIzsl/wxjKXRX2SNIBrN2WJlWRrNYmTuHFKZnw6vQdHsknm+nBitO+agbFG3mbieU03XgqA5JdJw6L8a5NlBkOeNVc0bBUt95ITTnR1z5qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907559; c=relaxed/simple;
	bh=OCKmQhHqPwtIVH8bB8hWe/XgUpfi6iWB8KZdLultpdc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WYvu6mDgYz1yX32x/jFoE7HnUSuBqQtDdn1BrzOzfhAHvjEfCUEu7A7iYGE+/IYFWpEVbCq0wyGm/i6yhc0AuwAngID+lYPETxRmhQ/NUiPTv6QwWQftD5xJkwC71PXYe5M/zMcdbCM0Me3ozUpe8OKCbWCxwnnddRFw1BTgCrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZPDwHxz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZPDwHxz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B041F00A3A;
	Fri, 28 Aug 2026 08:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787907557;
	bh=twYPRLPlM0J8tPwczyhxYmcPIOrd5B1WQTJSQmK8+74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QZPDwHxzuI25DWE0gU6jWTAM9MCiylZZikndl4r1ymI9BBRiO3IKTglPzhkJgwUyZ
	 o/twNBy+8lLrGUJI51G1vlOu0noL47d/Ed14tOVTDUpuTU71VHk12mbhb0tMaeYNYT
	 +JDqv3TBKJNA4cE9iT3sZPY0WI1hW4EPKCcPWTtdUM9sKF8DINbhB3GAMbxcwI9zjA
	 kTMnUG2FzFN9GcZ74qSVAV5IyhOVUYv7Mjg2EGKcMgqZ8d5v+oROqe5Gi9eS0IOIe4
	 eJtUEkcmqwsGSTe6vKTSJ2T73sGyedNKxKbT9DFwtRu2F7gs7t/RFA0MzWZ10nZnvv
	 h0n/qN5wD1dpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] leds: max77705: fix fwnode reference leak in
 max77705_add_led()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manush Prajwal" <manushprajwal555@gmail.com>
Cc: lee@kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <6a914ad5.1e1ac41d.2a3f62.4979@mx.google.com>
References: <6a914ad5.1e1ac41d.2a3f62.4979@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 08:59:16 +0000
Message-Id: <20260828085917.20B041F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [Low] The commit message subject violates the LED subsystem naming conven=
tions regarding capitalization.

Pre-existing issues:
- [Critical] Passing the wrong `led_classdev` reference to `max77705_led_br=
ightness_set_multi` causes an out-of-bounds pointer dereference.
- [Critical] Shared `max77705_rgb_blink()` callback uses incorrect `contain=
er_of` arithmetic for multicolor LEDs, causing out-of-bounds pointer derefe=
rence.
- [High] The driver passes a `struct fwnode_handle *` to the `%pOF` and `%p=
OFn` format specifiers.
- [High] Mixing OF-specific `of_get_available_child_count()` with generic `=
fwnode_for_each_child_node()` causes a zero-allocation buffer overflow on n=
on-Device Tree backends.
- [High] The return value of `max77705_parse_subled()` is completely ignore=
d in the non-RGB single-LED registration path.
- [High] Valid hardware channel 0 is erroneously rejected by the `!reg` che=
ck in `max77705_parse_subled()`.
- [High] Uninitialized return value 'ret' in 'max77705_led_brightness_set()=
'.
--

commit fd8007d53291c3b9d58b3510fc44a4453a7cab3d
Author: Manush Prajwal <manushprajwal555@gmail.com>

leds: max77705: fix fwnode reference leak in max77705_add_led()

In the RGB LED path of max77705_add_led(), the
fwnode_for_each_child_node() loop over the subled child nodes
returns directly on a max77705_parse_subled() failure without
releasing the reference held on the current child.

Fixes: 3b6eaa3db567 ("leds: Use fwnode_for_each_child_node() instead")

> leds: max77705: fix fwnode reference leak in max77705_add_led()

[Severity: Low]
Is this commit message following the LED subsystem naming conventions? The
LED subsystem guide mandates: "Always capitalize the description after the
subsystem prefix". Should "fix" be capitalized?

> diff --git a/drivers/leds/leds-max77705.c b/drivers/leds/leds-max77705.c
> index 1e2054c1bf80b..a5030c329587b 100644
> --- a/drivers/leds/leds-max77705.c
> +++ b/drivers/leds/leds-max77705.c
> @@ -193,8 +193,10 @@ static int max77705_add_led(struct device *dev, stru=
ct regmap *regmap, struct fw
> =20
>  		fwnode_for_each_child_node(np, child) {

[Severity: High]
This isn't a bug introduced by this patch, but mixing OF-specific
of_get_available_child_count() with generic fwnode_for_each_child_node()
causes a zero-allocation buffer overflow on non-Device Tree backends.

If the driver is instantiated via a non-OF backend (like software nodes),
to_of_node(np) returns NULL, causing of_get_available_child_count() to
return 0:

drivers/leds/leds-max77705.c:max77705_add_led() {
    ...
    int num_channels =3D of_get_available_child_count(to_of_node(np));
    ...
    info =3D devm_kcalloc(dev, num_channels, sizeof(*info), GFP_KERNEL);
    ...

devm_kcalloc() evaluates to ZERO_SIZE_PTR since num_channels is 0. Does
this fwnode_for_each_child_node() loop then iterate available child nodes
for non-OF backends anyway, resulting in writes to the ZERO_SIZE_PTR in
the loop body?

>  			ret =3D max77705_parse_subled(dev, child, &info[i]);

[Severity: High]
This is a pre-existing issue, but does max77705_parse_subled() pass a
struct fwnode_handle * to the %pOF format specifier?

drivers/leds/leds-max77705.c:max77705_parse_subled() {
    ...
    return dev_err_probe(dev, -EINVAL, "invalid \"reg\" of %pOFn\n", np);
    ...
    return dev_err_probe(dev, ret,
                         "failed to parse \"color\" of %pOF\n", np);

Since %pOF strictly expects a struct device_node *, passing a struct
fwnode_handle * causes the vsnprintf handler to read from invalid internal
struct offsets, which triggers a kernel panic when formatting an invalid
fwnode_handle as a device_node. This also occurs in max77705_add_led():

drivers/leds/leds-max77705.c:max77705_add_led() {
    ...
    return dev_err_probe(dev, ret,
                  "failed to parse \"color\" of %pOF\n", np);
    ...


[Severity: High]
This is a pre-existing issue, but does max77705_parse_subled() erroneously
reject valid hardware channel 0?

drivers/leds/leds-max77705.c:max77705_parse_subled() {
    ...
    ret =3D fwnode_property_read_u32(np, "reg", &reg);
    if (ret || !reg || reg >=3D MAX77705_LED_NUM_LEDS)
        return dev_err_probe(dev, -EINVAL, "invalid \"reg\" of %pOFn\n", np=
);
    ...

When parsing a subled node with reg =3D 0 (a perfectly valid hardware chann=
el
mapped to MAX77705_RGBLED_REG_LED0BRT), the condition evaluates to true
because !reg is true for 0. Does this logic incorrectly return -EINVAL,
making it impossible to configure the first hardware LED channel?

> -			if (ret < 0)
> +			if (ret < 0) {
> +				fwnode_handle_put(child);
>  				return ret;
> +			}
> =20
>  			info[i].intensity =3D 0;
>  			i++;

[Severity: High]
This is a pre-existing issue, but is the return value of
max77705_parse_subled() completely ignored in the non-RGB single-LED
registration path?

drivers/leds/leds-max77705.c:max77705_add_led() {
    ...
    } else {
        ...
        max77705_parse_subled(dev, np, info);

        led->subled_info =3D info;
    ...

When processing a single-color LED, max77705_parse_subled() is called, which
can return a negative error code. Does failing to check this return code
allow the driver to ignore the error and proceed registering an LED with
zero-initialized values?


[Severity: Critical]
This is a pre-existing issue, but does max77705_add_led() pass the wrong
led_classdev reference to max77705_led_brightness_set_multi()?

drivers/leds/leds-max77705.c:max77705_add_led() {
    ...
    ret =3D devm_led_classdev_multicolor_register_ext(dev, &led->mcdev, &in=
it_data);
    if (ret)
        return ret;

    ret =3D max77705_led_brightness_set_multi(&led->cdev, LED_OFF);
    ...

The driver manually calls max77705_led_brightness_set_multi() to set the
initial state of an RGB LED unconditionally on probe. It incorrectly passes
&led->cdev instead of the registered multicolor cdev &led->mcdev.led_cdev.

drivers/leds/leds-max77705.c:max77705_led_brightness_set_multi() {
    struct led_classdev_mc *mcdev =3D lcdev_to_mccdev(cdev);
    struct max77705_led *led =3D container_of(mcdev, struct max77705_led, m=
cdev);
    ...

The target function uses container_of() to subtract the offset of mcdev,
yielding a pointer that points into incorrectly aligned or preceding memory.
Does this memory corruption result in a consistent kernel panic during the
probe phase?


[Severity: Critical]
This is a pre-existing issue, but does the max77705_rgb_blink() callback use
incorrect container_of arithmetic for multicolor LEDs?

drivers/leds/leds-max77705.c:max77705_add_led() {
    ...
        cdev->blink_set =3D max77705_rgb_blink;
    ...

When the LED subsystem triggers the blink_set callback for an RGB LED, it
passes &led->mcdev.led_cdev.

drivers/leds/leds-max77705.c:max77705_rgb_blink() {
    struct max77705_led *led =3D container_of(cdev, struct max77705_led, cd=
ev);
    ...

max77705_rgb_blink() assumes it receives the single-color &led->cdev and
resolves the parent struct using container_of(cdev, struct max77705_led,
cdev). This subtracts 0 instead of the offset of mcdev, producing a pointer
that points inside the structure rather than at its beginning. Does this
cause an out-of-bounds pointer dereference leading to memory corruption?


[Severity: High]
This isn't a bug introduced by this patch, but does
max77705_led_brightness_set() return an uninitialized stack variable?

drivers/leds/leds-max77705.c:max77705_led_brightness_set() {
    int ret;

    for (int i =3D 0; i < num_colors; i++) {
        ...
    }
    return ret;
}

If a multi-color LED node is defined with no available child subleds,
num_channels evaluates to 0. The loop never executes, and the function
returns the uninitialized stack variable ret directly to callers. Can this
cause the probe function to fail randomly or mask real errors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6a914ad5.1e1ac41d.2=
a3f62.4979@mx.google.com?part=3D1
