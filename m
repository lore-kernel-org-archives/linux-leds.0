Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAAA2FFDD5;
	Mon,  3 Aug 2026 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772004; cv=none; b=qkOylUj0QhwpRnO+25ZzoILMQl7gbYLMKx0ES5BSL03QbTEcBYFWLT2X1DB8wtBEut/O+PoB3szE6QjpVCCNxoISWgze48kbdv2acexvXRQyTsGdRX5M2iLXOtsZcUBTNbXagF8xSZ0vNMk7baA1dnXx9TKkEmI9FymPPWKSOO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772004; c=relaxed/simple;
	bh=rM1WIBOxqlMaJjM09lf5E2hLl4uPzj7YFEVM6RZRnAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bqXYug4NieGxSOY9owUhJcQ/QNencOJS84RQnFvZpnTHSMq2e+FWfLsYn7SYeE2AFspigzWNXGIAihekEj9nCOvQqso64tRQPqCJ5+k+yRCBjSSEvmZIcJcVvyECmVUzMA/n4AVd/Cxj/lS/zPzBpPo5J/gF2TgLrbCm0Lus0UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nyPFmC2Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nyPFmC2Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB6F1F00A3A;
	Mon,  3 Aug 2026 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785772003;
	bh=2Ew02xxm577D7r5VWaVGh0LdsAXvHYVvxUjab2hzzOw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nyPFmC2QCdMHT0fdvOEbrzRsbKKATatJws4czs+PkJhDB/OMb3rtXG5Sv/cgf/t8+
	 xiL9g1A2n6uDEvp6HO2fuNIjOFHU1394yxOUvpGk7WHicL3LEdF4L95kpM2neGI4f7
	 XWsDchvR1zzAEKwJDFFp3rxkibY7E6G9gaLCXGoSpSTIAOwba8H0SVOdrgQBlWH4/p
	 VYJs0EBEMFkATKcKOqFbAJlCWwFmHFUefzq3hFY0a6iFAxyU8zLVwCgqmvdkkKUym2
	 yCGYxcEde+QycfroEdE+LiCmzuRhFZhMb8SbGb6HFDdbTrKyI66YLqQ2ICXZFmkc95
	 cmL5EicNY7EQQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC net-next 4/4] ptp: ocp: Add R4006 I2C peripheral topology
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-leds@vger.kernel.org
In-Reply-To: <25f255ac12a006059e0a442a5d750c31e9da1ae2.1785684064.git.ahmadexp@gmail.com>
References: <cover.1785684064.git.ahmadexp@gmail.com>
 <25f255ac12a006059e0a442a5d750c31e9da1ae2.1785684064.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 15:46:42 +0000
Message-Id: <20260803154642.8FB6F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] Repeated failures in firmware node registration inside `ptp_ocp_=
r4006_init_nodes` will leak `devm`-allocated memory because the function is=
 called from a retriable workqueue.

Pre-existing issues:
- [High] Lockless access to `dev->driver` in the global I2C notifier parent=
 tree traversal creates a TOCTOU race condition leading to a NULL pointer d=
ereference.
--

--- Patch [4]: [RFC net-next 4/4] ptp: ocp: Add R4006 I2C peripheral topolo=
gy ---
commit 6482a6be1fc3b33821906c9b60253b2b40290bb4
Author: Ahmad Byagowi <ahmadexp@gmail.com>

    ptp: ocp: Add R4006 I2C peripheral topology

This commit adds support for the R4006 I2C peripheral topology, detecting
the board via EEPROM and describing the topology with software nodes. It
registers standard I2C clients upon adapter appearance and handles I2C
bus notifications for dynamic population.

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 35e911f1ad78c..b362a7c4dbb5f 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
[ ... ]
> +static int
> +ptp_ocp_r4006_init_nodes(struct ptp_ocp *bp)
> +{
[ ... ]
> +	r4006 =3D devm_kzalloc(dev, sizeof(*r4006), GFP_KERNEL);
> +	if (!r4006)
> +		return -ENOMEM;
> +
> +	r4006->mux_node.name =3D
> +		devm_kasprintf(dev, GFP_KERNEL, "ocp%d-r4006-mux", bp->id);
[ ... ]
> +	ret =3D software_node_register_node_group(r4006->node_group);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register R4006 firmware nodes\n");
> +
> +	r4006->registered =3D true;
> +	bp->r4006 =3D r4006;
> +	return 0;
> +}

[Severity: Medium]
Will this leak devm-allocated memory on failure?=20

Since ptp_ocp_r4006_init_nodes() is called from ptp_ocp_i2c_work() (which
can be dynamically re-triggered by I2C bus notifications), any deterministic
failure in software_node_register_node_group() will cause an early return
without freeing the memory allocated via devm_kzalloc() and
devm_kasprintf() earlier in this function. Could this repeatedly leak
memory on the device's devres list with each worker execution?

[ ... ]
> +static struct ptp_ocp *
> +ptp_ocp_i2c_parent(struct device *child)
> +{
> +	struct device *dev =3D child;
> +
> +	while ((dev =3D dev->parent))
> +		if (dev->driver && !strcmp(dev->driver->name, KBUILD_MODNAME))
> +			return dev_get_drvdata(dev);
> +
> +	return NULL;
> +}

[Severity: High]
This is a pre-existing issue, but does this lockless check of dev->driver
risk a NULL pointer dereference?

If a parent device is concurrently unbinding while this global I2C notifier
is traversing the tree, the driver core clears its dev->driver pointer.
If dev->driver is evaluated as non-NULL but becomes NULL right before
strcmp() accesses dev->driver->name, it could crash the kernel.

Should we be taking the device_lock() before evaluating dev->driver?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785684064.gi=
t.ahmadexp@gmail.com?part=3D4
