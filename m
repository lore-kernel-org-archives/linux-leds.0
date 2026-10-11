Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D9F26159E;
	Sun, 11 Oct 2026 19:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791746427; cv=none; b=iZJJZDzSeV9MgAY/swhlRsALov6xpn19Yz5v9DkYk9ZGrZBYMn8CxugOZh1SLirDs9qgZIarPyjBRTPjIAkNu8kecM57a9PVi4Z2VQXw23JQHOwxGljyf330WxjThTvdtiwnd8/4XB+OM+SvQMpN6+yDHMVkPLS67/NDxk2N6u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791746427; c=relaxed/simple;
	bh=lUnUxOEkVg71kCONf35t3yvQZbGaee3xRgfthx3T35A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AVQ3v7z9ByIOqdejBcGoLgzM6eTvyydj8pVrk44KDCglildZdf4UPO0w/XGtgL9P3XXpC6uqW5uYuhTBx8u0nKKslyWlFsSlgxV804NfHDYfotkFQk/dF+Uobaf57KYDHdmrZ2ccceTOP7HV1B9pRVlYWaXzgS5bLLMwPHGCFJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZE4nzcsJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZE4nzcsJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C4B1F0089B;
	Sun, 11 Oct 2026 19:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791746425;
	bh=/1oZ8IwCbWBgP45aINIQDVjTS27tivPnHZrbhTJlYM8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZE4nzcsJTOb+fOezzCt8eBo2+WIbFyWfD8FcpA4KHPhP38AoRG2KULUDOKUCSiQ3M
	 bBgy93OA+SVbvI0xekhfMtaoHs04Io2P/oJGDYkHvCg9hRhQIJs5XYXEwljPqTcdzg
	 25AX6CYhvCD2AWGcUm3XhoCOphVKmqvVoZQcCvIqyVkIYQwYNkPgYdXqI6i2b7RFGl
	 sy5XGHIvs7P8c7uitYeeXk9kbKLjEshxj3XWP8RKbYIK9FvuNDyBlyLnYY6rQZEbyB
	 i/bHw12nTzqpqc21PdFjMzoD45bJkpn+kNikVcTNGC0kvQKlqKGad887T6weUroySo
	 AO2U4sqIf/4ZA==
Message-ID: <sashiko-outbox-167402@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] leds: flash: lm3643: Describe the LED of ACPI
 boards without LED nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rillian Grant" <rillian.grant@gmail.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261011191026.149338-4-rillian.grant@gmail.com>
References: <20261011191026.149338-1-rillian.grant@gmail.com>
 <20261011191026.149338-4-rillian.grant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 11 Oct 2026 19:20:24 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] leds: flash: lm3643: TOCTOU race in swnode registration causes UAF
--

commit a08dd419e737ce9719711220082ac93884d1bc47
Author: Ruslan Koreev <koreev.r@gmail.com>

leds: flash: lm3643: Describe the LED of ACPI boards without LED nodes

This commit adds a DMI table and software node descriptions for Lenovo
ThinkPads that enumerate the LM3643 through ACPI without a _DSD. This
fallback allows the Windows Hello IR flood illuminator to be probed
and registered when the firmware provides no child nodes.

> diff --git a/drivers/leds/flash/leds-lm3643.c b/drivers/leds/flash/leds-l=
m3643.c
> index cbe66e90d8e1b..18ac75df72e2a 100644
> --- a/drivers/leds/flash/leds-lm3643.c
> +++ b/drivers/leds/flash/leds-lm3643.c

[ ... ]

> +static int lm3643_add_dmi_leds(struct device *dev)
> +{
> +	const struct dmi_system_id *id;
> +	const struct software_node **nodes;
> +	int ret;
> +
> +	if (!has_acpi_companion(dev))
> +		return 0;
> +
> +	id =3D dmi_first_match(lm3643_dmi_leds);
> +	if (!id)
> +		return 0;
> +
> +	nodes =3D id->driver_data;
> +	/* The nodes are static: a second chip on the same board cannot reuse t=
hem */
> +	if (software_node_fwnode(nodes[0]))
> +		return dev_err_probe(dev, -EBUSY, "LED description already in use\n");
> +
> +	ret =3D software_node_register_node_group(nodes);

[Severity: High]
Is there a potential race condition here when multiple devices probe
concurrently?

If two threads execute lm3643_add_dmi_leds() simultaneously (for example,
during concurrent sysfs bind or async probe of two LM3643 devices matching
the same DMI table), they both might pass the lockless=20
software_node_fwnode(nodes[0]) check before either registers the nodes.

Thread A could then successfully register the group via
software_node_register_node_group(nodes).

Thread B would subsequently attempt to register the same static nodes array,
fail, and drop into the error path within software_node_register_node_group=
():

drivers/base/swnode.c:software_node_register_node_group() {
    ...
		ret =3D software_node_register(node_group[i]);
		if (ret) {
			software_node_unregister_node_group(node_group);
			return ret;
		}
    ...
}

Because software_node_unregister_node_group() unconditionally unregisters
the entire array, Thread B's failure teardown will free the nodes that
Thread A successfully registered.=20

Could this lead to a use-after-free when Thread A subsequently calls
device_get_child_node_count() and accesses the freed software nodes?

> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register the LED description=
\n");
> +
> +	set_secondary_fwnode(dev, software_node_fwnode(nodes[0]));
> +	dev_dbg(dev, "no LED nodes in firmware, using the DMI description\n");
> +
> +	return devm_add_action_or_reset(dev, lm3643_remove_dmi_leds, dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261011191026.1493=
38-1-rillian.grant@gmail.com?part=3D3
