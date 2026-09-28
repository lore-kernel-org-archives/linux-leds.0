Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CF0471CE9;
	Mon, 28 Sep 2026 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589016; cv=none; b=fKM3KLq1KzwEudK8iL7o8CyCpqd/MDiu3HqHpxHS1dB/m/zBu1E/AZObWbh8g3KNiUqXLorJgjeDkDgwGez5dGVQpDFqSdaVbjxbGr7fv0r+e+oA7WV0owRGhGi/OhUTMhwdSAmcD2aJH8VKiR1I7/ftSFGlKcCZNOKJ6HAYBQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589016; c=relaxed/simple;
	bh=zHUU+uClM0M1mE+nPUqMdsPdPDSkifP6Bvt0eL07LSY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b6VCwFQu5G6jvjowRypW+x+aFm7Tph8j7YGGW4OftQ+kJIOwmKPJ4IdrgEpsLfGnhcA3Ci9lwAzOypfe+j0t4DCOomWXSmOt4sjlehLcalR0FZHFkw8KNm+UQ8JBiWU1bWDv9/2OpbNRW0nRxqYXuE6/Es1tMjBRRwSJhXz9rpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WEfUAG5E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WEfUAG5E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 096591F000FF;
	Mon, 28 Sep 2026 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790589015;
	bh=97HlRK2LeetYFb0V1l2CYBDJ8hAwGwK/Qd/Gpzbi400=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WEfUAG5ERbQKf4QASEUaqXkVMb7Gqv9UfQcy5JsXv6k5u0Eu1ebAi28veHvs2YD47
	 wU+IHrfeFST3QPcTRoY29NDY/FAaFgglmiRZ8KovSj6wWBn8CuDnnalTRxMJa0IacI
	 1WW4rnlIk5WP2u75hysBa8Ox4baIlU0BBJtTNZ5JXkY605fQ88GHHtVaxTwm5bRhT9
	 BTnLjj9PAPZDxZoaoJRbUeYPtugNlp5dqh6VqdmNPNO9za5HPKqFEdYoxXPxBcB6Hz
	 kRwc0XgR+MfSwGonxEdcZE+MYm+jJbfNuLhO8VkmV+gyshzED65u4/5I1xx2Ivg61j
	 YOKn32pnr5SZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] leds: flash: lm3643: Describe the LED of ACPI
 boards without LED nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rillian Grant" <rillian.grant@gmail.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, linux-leds@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260928094302.86966-4-rillian.grant@gmail.com>
References: <20260928094302.86966-1-rillian.grant@gmail.com>
 <20260928094302.86966-4-rillian.grant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 09:50:14 +0000
Message-Id: <20260928095015.096591F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] leds: lm3643: informational logging during probe violates subsystem=
 guidelines
--

commit 526bd68dbe5899ef1f96b678f6b5d764ba338f79
Author: Ruslan Koreev <koreev.r@gmail.com>

leds: flash: lm3643: Describe the LED of ACPI boards without LED nodes

This commit adds a DMI table to describe the LM3643 LED setup on Lenovo
ThinkPads that lack proper firmware descriptions (no _DSD). It provides
a software node configuration to drive the Windows Hello IR flood
illuminator.

> diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-l=
m3643.c
> index bbe9358c9caaf..1c0de38ebcdf4 100644
> --- a/drivers/leds/flash/leds-lm3643.c
> +++ b/drivers/leds/flash/leds-lm3643.c
[ ... ]
> @@ -690,6 +691,92 @@ static int lm3643_register_led(struct device *dev, s=
truct lm3643 *chip,
[ ... ]
> +static int lm3643_add_dmi_leds(struct device *dev)
> +{
[ ... ]
> +	ret =3D software_node_register_node_group(nodes);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register the LED description=
\n");
> +
> +	set_secondary_fwnode(dev, software_node_fwnode(nodes[0]));
> +	dev_info(dev, "no LED nodes in firmware, using the DMI description\n");

[Severity: Low]
Does this informational log message violate the LED subsystem guidelines?

The subsystem rules strictly mandate: "Only log errors or warnings." Since =
this
call to dev_info() executes automatically in lm3643_add_dmi_leds() during
hardware enumeration on matching laptops, it will add unnecessary minor log
noise during boot.

> +
> +	return devm_add_action_or_reset(dev, lm3643_remove_dmi_leds, dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928094302.8696=
6-1-rillian.grant@gmail.com?part=3D3
