Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A8F3630B7;
	Sat, 15 Aug 2026 23:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786835514; cv=none; b=Du/v5GHEIzKTdLfC7vJiYj/5RI62ydwNkEdg2It9bYS/PWnaOD7x26elKp7WzdHphgKSTr6v/VWYBvxfe/eYJjtUIFSlhDhe39gEwPrAbPcYtfUBvVGQGu+MinCt7cEeiHttLrWWJlSJjDxjiscsFrmPXqpqj9FDbW57dxJHQqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786835514; c=relaxed/simple;
	bh=B5U/8xJouhlQRZHozs/7hrvZD/c5iWKVnmupWbdzC5M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U15WBWrVD+uznSBfxI9yh75ulVQh0u67wphTnfBxjHWbedr/O+CzLZLuRsHx9wUqKdvQvHFBcc4k/G0Wmf7m/eqfTOmH9jBN+Eto7s/JS7UG5ytH4I0Ja1M6qxspiaoxj0uV90wUCDncQeM4e6Dw07ciRZY3DPZFJYwSmvJwT/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8Z9i8lU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8Z9i8lU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 786EF1F000E9;
	Sat, 15 Aug 2026 23:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786835512;
	bh=HkoUFAeCTTrlq7O/vmlLe4FKFb9/eRJ/9qiUtbnTc5o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O8Z9i8lUZuGCLqLGbMhMvf7VCNBenzAbjqPi2YPkODL0v/lWPxBkeITyEb/gPCB6g
	 VBw3Nx5TshdppxfHDzng49YX6a0mvzcT3k4W8IcMt+n8LhN9Jxo+u+16+39B+9GWpV
	 2sIYNDyGjv15bYBy3hoDM+l3u9tVtOm5dt/3HTAw9wwnoJlP7i17507XXD5rv8EL5R
	 vWEbWtpoj4BDqnGFSObw4YycjqTuyvVYuEcvAT7gPA5QYaRcFfihFBiRBPtCZCf5B2
	 s31fwpjXVZyjkJEbVJMOzkJqTid7KY40jlQMRrOpW9mohKiGqZyKd6LjAglVITp+TL
	 BHWjh6X5lBrGA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 4/7] ptp: ocp: Track EEPROM fields
 independently
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ahmad Byagowi" <ahmadexp@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-leds@vger.kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <3186cc1f1c51b548439fda558e9e4052a481b787.1786747084.git.ahmadexp@gmail.com>
References: <cover.1786746757.git.ahmadexp@gmail.com>
 <3186cc1f1c51b548439fda558e9e4052a481b787.1786747084.git.ahmadexp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 23:11:52 +0000
Message-Id: <20260815231152.786EF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Kernel stack memory disclosure to userspace due to uninitialized b=
uffer used with short reads.
- [Medium] The EEPROM discovery loop aborts on the first error, contradicti=
ng the commit's intent to track fields independently.
- [Medium] Internal `-EPROBE_DEFER` error code is leaked to userspace via t=
he `serialnum_show` sysfs attribute.
--

--- Patch [4]: [PATCH net-next v5 4/7] ptp: ocp: Track EEPROM fields indepe=
ndently ---
commit c7acafdfcb181ccb357d00ccd6cff4bb48838592
Author: Ahmad Byagowi <ahmadexp@gmail.com>

ptp: ocp: Track EEPROM fields independently

This patch updates the EEPROM discovery logic to serialize reads and
track the availability of the board ID and serial number independently.
It aims to ensure that failure to read one field does not prevent the
discovery or publication of the other field.

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 3d26ec1f7b9ec..31a4c9dfe391c 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c
[ ... ]
> @@ -1969,21 +1977,50 @@ ptp_ocp_nvmem_device_put(struct nvmem_device **nv=
memp)
>  	*nvmemp =3D NULL;
>  }
> =20
> -static void
> -ptp_ocp_read_eeprom(struct ptp_ocp *bp)
> +static int
> +ptp_ocp_read_eeprom(struct ptp_ocp *bp, unsigned int fields)
>  {
>  	const struct ptp_ocp_eeprom_map *map;
>  	struct nvmem_device *nvmem;
> +	u8 data[OCP_BOARD_ID_LEN];
> +	const char *field_name =3D "data";
>  	const void *tag;
> -	int ret;
> -
> -	if (!bp->i2c_ctrl)
> -		return;
> +	unsigned int field;
> +	int ret =3D 0;
> =20
>  	tag =3D NULL;
>  	nvmem =3D NULL;
[ ... ]
>  	for (map =3D bp->eeprom_map; map->len; map++) {
[ ... ]
> +		if (map->tag !=3D tag) {
>  			tag =3D map->tag;
>  			ptp_ocp_nvmem_device_put(&nvmem);
> +		}
> +		if (!nvmem) {
>  			nvmem =3D ptp_ocp_nvmem_device_get(bp, tag);
>  			if (IS_ERR(nvmem)) {
>  				ret =3D PTR_ERR(nvmem);
> -				goto fail;
> +				goto out;

[Severity: Medium]
Since the commit message states the intent is to avoid hiding an otherwise
valid board ID when the serial EEPROM block is missing, does aborting the
loop here on the first error contradict that?

If nvmem_device_get() fails for the first entry in bp->eeprom_map, this
goto out will skip reading any subsequent entries.

>  			}
>  		}
> -		ret =3D nvmem_device_read(nvmem, map->off, map->len,
> -					BP_MAP_ENTRY_ADDR(bp, map));
> -		if (ret !=3D map->len)
> -			goto fail;
> +		ret =3D nvmem_device_read(nvmem, map->off, map->len, data);
> +		if (ret < 0)
> +			goto out;

[Severity: Medium]
Similarly, if nvmem_device_read() fails for an entry, won't this goto out
also prevent subsequent fields from being discovered?

> +
> +		memcpy(BP_MAP_ENTRY_ADDR(bp, map), data, map->len);

[Severity: High]
Does this allow uninitialized stack memory to be copied to the persistent
device structure?

The data buffer is allocated uninitialized on the stack. If nvmem_device_re=
ad()
returns a short read (where 0 <=3D ret < map->len), the error check above
(ret < 0) will pass. The memcpy will then copy the entire map->len bytes,
including uninitialized kernel stack data, which could later be disclosed to
userspace via sysfs attributes like serialnum_show or the devlink interface.

> +		if (field =3D=3D OCP_EEPROM_BOARD_ID) {
[ ... ]
> @@ -3757,9 +3805,17 @@ static ssize_t
>  serialnum_show(struct device *dev, struct device_attribute *attr, char *=
buf)
>  {
>  	struct ptp_ocp *bp =3D dev_get_drvdata(dev);
> +	int ret;
> =20
> -	if (!bp->has_eeprom_data)
> -		ptp_ocp_read_eeprom(bp);
> +	/* Pairs with field publication in ptp_ocp_read_eeprom(). */
> +	if (!smp_load_acquire(&bp->has_serial)) {
> +		ret =3D ptp_ocp_read_eeprom(bp, OCP_EEPROM_SERIAL);
> +		if (ret)
> +			return ret;

[Severity: Medium]
Can this leak internal kernel error codes to userspace?

If nvmem_device_get() is not yet ready, ptp_ocp_read_eeprom() legitimately
returns -EPROBE_DEFER. Returning this directly from the sysfs show handler
will expose -EPROBE_DEFER (-517) to userspace applications, breaking the
POSIX ABI. Should this be translated to -ENODATA or -EAGAIN?

> +		/* Pairs with field publication in ptp_ocp_read_eeprom(). */
> +		if (!smp_load_acquire(&bp->has_serial))
> +			return -ENODATA;
> +	}
> =20
>  	return sysfs_emit(buf, "%pM\n", bp->serial);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1786746757.gi=
t.ahmadexp@gmail.com?part=3D4
