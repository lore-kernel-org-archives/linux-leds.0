Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E6E3644BC
	for <linux-leds@vger.kernel.org>; Fri, 28 Aug 2026 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908625; cv=none; b=Adx4otJ8BF3n6Y4uWi8icXURFY53kANXmW7koqA32mPUZ5qW69lSjwNp84uNwWZMuOmHDwixse6BUaAF4Q5Egku/8azKXekDjtFaVjTphkJ8iUkTtbBntpsnKcul/50pZTr3PinvXliSX2L5DAuSch5TM5tLb7dmF94I1vTuqhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908625; c=relaxed/simple;
	bh=CYRU8tqHBiL6K2S7cpEWEuI3NsT9F7tfvuGqRI5BQSc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E+XuZliAZT3B7BwsyK+wLkWnqOuQn2bgRRgrb4OttH5+WZcnPqVKY8r/KXyWtonyMHtlkKuZ93kVDxj3SXz+MO8tl2IOx0jGMrjdv1s2mgmjYf3UyWEStXsRWyESdrBC2FIQ/KBZChqf/g8Vj5UKxferKtUVa24M8zkeSFxeDHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gP5Lb+lM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gP5Lb+lM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94AF01F00A3A;
	Fri, 28 Aug 2026 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787908623;
	bh=rpPLdJAdH4DfwPhy8nh6rmZTROB2GmkOgpoiM/9oJUE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gP5Lb+lM7gXu4Z6+Fw2jt+nlzTTeboIY6o+Ge+jvjT/3Y3OEbYzVt+Ln1QpfEp/8A
	 XPKATXeS02SI5/7UtM7mGXnvfCUrqQokvECaNiQ/8kTwy6wHgs0xhmbTKAafnyomxl
	 AGY3MJyqeAUxTBhNXqhPtEzp70safd6NOHX/xY9HChVLRPC5YScvMKTX6ewuqUhAOR
	 3rOru2b73gm5QZYj2Axsw0SOJ8D2ZEcrBHCfZguLhXDZAVyO8PmmBej/5ixdLQdnSU
	 xdWvUE7vPKjy10dB/lUsqVKuf4Eq7319mhJeMuMNlR1gatGaBPG1FjAMpv4S54a9WC
	 8DBoMGi7qMvqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] leds: max77705: use
 fwnode_for_each_child_node_scoped() in max77705_add_led()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manush Prajwal" <manushprajwal555@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <6a914e1e.7d702ed2.1273e8.2a52@mx.google.com>
References: <6a914e1e.7d702ed2.1273e8.2a52@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 09:17:03 +0000
Message-Id: <20260828091703.94AF01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Low] The commit message description is not capitalized.

Pre-existing issues:
- [High] Mismatch between OF and fwnode child iteration APIs causes buffer =
overflow and ZERO_SIZE_PTR dereference on non-OF platforms.
- [High] Passing `struct fwnode_handle *` to `%pOF` and `%pOFn` format spec=
ifiers causes undefined behavior and kernel panics.
- [High] Invalid `container_of` usage leads to out-of-bounds memory accesse=
s and kernel panics.
- [High] Ignored return value from max77705_parse_subled() in the single LE=
D branch causes invalid hardware configuration.
--

commit 7369706159561c68f4aeecf0631313b78d7a8153
Author: Manush Prajwal <manushprajwal555@gmail.com>

leds: max77705: use fwnode_for_each_child_node_scoped() in max77705_add_led=
()
   =20
Rework the subled loop in max77705_add_led() around
fwnode_for_each_child_node_scoped() instead of adding a manual
fwnode_handle_put(child) before the early return on a
max77705_parse_subled() failure, so the reference on the current
child fwnode is released automatically on every exit path from the
loop. child is never used outside the loop, so the now-unused outer
child declaration is dropped along with it.

> leds: max77705: use fwnode_for_each_child_node_scoped() in max77705_add_l=
ed()

[Severity: Low]
This isn't a bug, but should the commit message subject start with a capital
letter ("Use" instead of "use") to match the LED subsystem commit message p=
refix
conventions?

> diff --git a/drivers/leds/leds-max77705.c b/drivers/leds/leds-max77705.c
> index 1e2054c1bf80b..4fd803c959890 100644
> --- a/drivers/leds/leds-max77705.c
> +++ b/drivers/leds/leds-max77705.c

[ ... ]

> @@ -191,7 +190,7 @@ static int max77705_add_led(struct device *dev, struc=
t regmap *regmap, struct fw
>  		cdev->brightness_set_blocking =3D max77705_led_brightness_set_multi;
>  		cdev->blink_set =3D max77705_rgb_blink;

[Severity: High]
This is a pre-existing issue, but does the cdev assignment and subsequent
container_of() usage cause out-of-bounds memory accesses?

In max77705_add_led(), the struct fields are copied by value into the
independent cdev:

    led->cdev =3D *cdev;

When max77705_rgb_blink() is called for the multicolor LED, it receives
&led->mcdev.led_cdev, but uses container_of() expecting the independent cde=
v:

    struct max77705_led *led =3D container_of(cdev, struct max77705_led, cd=
ev);

This yields a pointer shifted by sizeof(struct led_classdev), leading to
out-of-bounds reads.

Conversely, when max77705_add_led() manually calls:

    ret =3D max77705_led_brightness_set_multi(&led->cdev, LED_OFF);

The function uses lcdev_to_mccdev() and container_of() expecting the embedd=
ed
mcdev:

    struct led_classdev_mc *mcdev =3D lcdev_to_mccdev(cdev);
    struct max77705_led *led =3D container_of(mcdev, struct max77705_led, m=
cdev);

This subtracts sizeof(struct led_classdev) from an offset 0 pointer, result=
ing
in a negative offset pointer underflow.

> -		fwnode_for_each_child_node(np, child) {
> +		fwnode_for_each_child_node_scoped(np, child) {

[Severity: High]
This is a pre-existing issue, but does this fwnode loop cause a buffer
overflow and ZERO_SIZE_PTR dereference on non-OF platforms?

Earlier in max77705_add_led(), the allocation is sized using an OF-specific=
 API
that returns 0 for non-OF nodes:

    int num_channels =3D of_get_available_child_count(to_of_node(np));
    ...
    info =3D devm_kcalloc(dev, num_channels, sizeof(*info), GFP_KERNEL);

If num_channels is 0, devm_kcalloc() allocates 0 bytes and returns
ZERO_SIZE_PTR. However, the fwnode_for_each_child_node_scoped() loop
indiscriminately iterates over all fwnode children. Writing to &info[i] ins=
ide
the loop will then dereference the ZERO_SIZE_PTR, causing an immediate page
fault and kernel panic.

>  			ret =3D max77705_parse_subled(dev, child, &info[i]);

[Severity: High]
This is a pre-existing issue, but does max77705_parse_subled() pass a
struct fwnode_handle * to a %pOFn format specifier?

When parsing fails in max77705_parse_subled():

    ret =3D fwnode_property_read_u32(np, "reg", &reg);
    if (ret || !reg || reg >=3D MAX77705_LED_NUM_LEDS)
        return dev_err_probe(dev, -EINVAL, "invalid \"reg\" of %pOFn\n", np=
);

The %pOF specifiers strictly expect a struct device_node *. Because
fwnode_handle is embedded at a non-zero offset within device_node, the
formatting engine treats the fwnode pointer as the start of the device_node
struct, leading to memory corruption or a kernel panic when strings are read
from incorrect offsets.

This also appears to happen in max77705_add_led() for the "color" property
error messages.

>  			if (ret < 0)
>  				return ret;

[Severity: High]
This is also a pre-existing issue, but is the return value of
max77705_parse_subled() ignored in the single LED branch?

In the single LED initialization branch:

    } else {
        info =3D devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
        if (!info)
            return -ENOMEM;

        max77705_parse_subled(dev, np, info);

The return value is ignored. If parsing fails, info->channel remains 0 (from
devm_kzalloc()). Since max77705_parse_subled() explicitly rejects !reg (0),
channel 0 is invalid. The driver proceeds to register the LED classdev and =
calls
max77705_led_brightness_set_single(&led->cdev, LED_OFF), which issues I2C
commands for the invalid channel 0, potentially causing hardware
misconfiguration.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/6a914e1e.7d702ed2.1=
273e8.2a52@mx.google.com?part=3D1
