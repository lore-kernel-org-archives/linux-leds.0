Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94559480338;
	Tue, 18 Aug 2026 16:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072245; cv=none; b=YVzNTk+5WhNyPii89pkTZ/+q0WkC64+RsB2UKxw0NyBTZ5vh2/eCA1LxkkcPG3BawvJMRsjvez4p7e9cdVeGg3YpL43YW8jP+d+8eF8tp/j9KnZgl2QsKTEayGzovVEe6ncUOVsEHRxHE+2fIkQh1prVpQhslcHICHUxx5OJvzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072245; c=relaxed/simple;
	bh=n/XY/pSuSZA2jwpn34eWYC3VcvdQOulHrfURKOIPhMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l2HE/0AxxU6jIJgxK5L95I2me05lLSEt9NebvEmE7V6mi+RMlTcmDa/KwFPLD5cczIYjWl7aS2MgHngUR2JpzOA6904red1t2W8kNQBRThQvJStIzgkFzP7e4ozXAFhD6ec3GDkvLgQjImlqPNShqcnns2dumLiVY9o24hO16Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9KRxPZY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9KRxPZY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A547D1F000E9;
	Tue, 18 Aug 2026 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787072239;
	bh=L7hnjwjuJuK6d2Eb9sgUjOmCfGOCk6qL0hIsvFYx8RI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=F9KRxPZYaBAE53aTuj1hnV4BOx7BD/BSRc4NgR/JoEU9YTMmMM/ZHdJpXbQLK8SRV
	 l4Xs0MduQKVVl6Y14VIam2l/IQu1T9STve2yssSlHPiqNXxKnZodntJRcNY9Fln549
	 S5QzgAbOICRk6z6osu3/zPM4Jn9HqRnum7KQLj7yAyKc9rAusVm4+28oSzbkyVOhnW
	 EHSjzMGeN6jNH5xWqPKCJxpxEMbnULyrAyg9DpuMw2OjQhfHUJnE+hYotyr1VNrjxN
	 M1BwFkhWGvmaoE3JTldv61OCYRxNdeJQt+6eUMoHCbPdWvlXO1Gac/Lhai8hbIGkUx
	 PALp+iWVNT25A==
From: Jakub Kicinski <kuba@kernel.org>
To: ahmadexp@gmail.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	peda@lysator.liu.se,
	trannamatk@gmail.com,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next v5 4/7] ptp: ocp: Track EEPROM fields independently
Date: Tue, 18 Aug 2026 09:57:17 -0700
Message-ID: <20260818165717.4008441-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <3186cc1f1c51b548439fda558e9e4052a481b787.1786747084.git.ahmadexp@gmail.com>
References: <3186cc1f1c51b548439fda558e9e4052a481b787.1786747084.git.ahmadexp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
ptp: ocp: Track EEPROM fields independently

This replaces the single has_eeprom_data flag with per-field has_board_id
and has_serial flags, serializes EEPROM discovery under a new eeprom_lock
mutex, and makes ptp_ocp_read_eeprom() take a field mask and return an
error.  devlink now publishes whichever field is available and
serialnum_show() propagates read errors.

No Link: tags in the commit header.

The commit message describes fixing a user-visible defect:

  "Requiring both reads to succeed before publishing either field makes a
  missing serial EEPROM block board profile selection and hides an otherwise
  valid board ID."

[Severity: Low]
Should this carry a Fixes: tag?  The condition described is reachable on
shipping hardware: fb_eeprom_map places board_id on the untagged '24c02'
client and serial on the "mac" tagged '24mac402' client, so one of the two
can be absent while the other works, and the old code gated both
ptp_ocp_devlink_info_get() and serialnum_show() on has_eeprom_data.  The
all-or-nothing reader, the two-entry map with the "mac" tag and the devlink
publication all came in with commit 0cfcdd1ebcfe ("ptp: ocp: add nvmem
interface for accessing eeprom"), which would be the Fixes: target.

If this is instead meant as preparatory work and not stable material (the
patch does change sysfs error semantics), could the changelog say so
explicitly?

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 3d26ec1f7b9ec..31a4c9dfe391c 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c

[ ... ]

> @@ -1969,21 +1977,50 @@ ptp_ocp_nvmem_device_put(struct nvmem_device **nvmemp)
>  	*nvmemp = NULL;
>  }
>  
> -static void
> -ptp_ocp_read_eeprom(struct ptp_ocp *bp)
> +static int
> +ptp_ocp_read_eeprom(struct ptp_ocp *bp, unsigned int fields)
>  {
>  	const struct ptp_ocp_eeprom_map *map;
>  	struct nvmem_device *nvmem;
> +	u8 data[OCP_BOARD_ID_LEN];
> +	const char *field_name = "data";
>  	const void *tag;
> -	int ret;
> -
> -	if (!bp->i2c_ctrl)
> -		return;
> +	unsigned int field;
> +	int ret = 0;
>  
>  	tag = NULL;
>  	nvmem = NULL;
> +	mutex_lock(&bp->eeprom_lock);
> +	fields &= OCP_EEPROM_ALL;
> +	if (bp->has_board_id)
> +		fields &= ~OCP_EEPROM_BOARD_ID;
> +	if (bp->has_serial)
> +		fields &= ~OCP_EEPROM_SERIAL;
> +	if (!fields)
> +		goto out;
> +	if (!bp->i2c_ctrl || !bp->eeprom_map) {
> +		ret = -ENODEV;
> +		goto out;
> +	}
>  
>  	for (map = bp->eeprom_map; map->len; map++) {
> +		if (map->bp_offset == offsetof(struct ptp_ocp, board_id)) {
> +			field = OCP_EEPROM_BOARD_ID;
> +			field_name = "board ID";
> +			if (bp->has_board_id)
> +				continue;
> +		} else if (map->bp_offset == offsetof(struct ptp_ocp, serial)) {
> +			field = OCP_EEPROM_SERIAL;
> +			field_name = "serial number";
> +			if (bp->has_serial)
> +				continue;
> +		} else {
> +			continue;
> +		}
> +
> +		if (!(fields & field))
> +			continue;
> +
>  		if (map->tag != tag) {
>  			tag = map->tag;
>  			ptp_ocp_nvmem_device_put(&nvmem);
> @@ -1992,24 +2029,34 @@ ptp_ocp_read_eeprom(struct ptp_ocp *bp)
>  			nvmem = ptp_ocp_nvmem_device_get(bp, tag);
>  			if (IS_ERR(nvmem)) {
>  				ret = PTR_ERR(nvmem);
> -				goto fail;
> +				goto out;
>  			}
>  		}
> -		ret = nvmem_device_read(nvmem, map->off, map->len,
> -					BP_MAP_ENTRY_ADDR(bp, map));
> -		if (ret != map->len)
> -			goto fail;
> +		ret = nvmem_device_read(nvmem, map->off, map->len, data);
> +		if (ret < 0)
> +			goto out;

[Severity: Medium]
Are the two fields really independent in both directions here?  Both failure
paths inside the loop, the ptp_ocp_nvmem_device_get() failure and this
nvmem_device_read() failure, leave the map walk entirely rather than
recording a failure for that one field and moving on to the next requested
entry.

fb_eeprom_map lists the board ID first, and it lives on a different I2C
client than the serial number:

drivers/ptp/ptp_ocp.c:
	static struct ptp_ocp_eeprom_map fb_eeprom_map[] = {
		{ EEPROM_ENTRY(0x43, board_id) },
		{ EEPROM_ENTRY(0x00, serial), .tag = "mac" },
		{ }
	};

So if the '24c02' board-ID EEPROM is missing or unreadable while the
'24mac402' MAC EEPROM is fine, ptp_ocp_devlink_info_get() calls
ptp_ocp_read_eeprom(bp, OCP_EEPROM_ALL), the walk bails on the first entry
and the serial entry is never attempted.  has_serial stays false, so
devlink_info_serial_number_put() is skipped on every subsequent request.

Isn't that the mirror image of the case the changelog says it removes, "Let
devlink report whichever fields are available"?  Would a per-field error
that continues to the next map entry be closer to the intent?

The serialnum sysfs path escapes this only because it asks for
OCP_EEPROM_SERIAL and skips the board-ID entry.

> +
> +		memcpy(BP_MAP_ENTRY_ADDR(bp, map), data, map->len);
> +		if (field == OCP_EEPROM_BOARD_ID) {
> +			/* Publish the field before marking it ready. */
> +			smp_store_release(&bp->has_board_id, true);
> +		} else {
> +			/* Publish the field before marking it ready. */
> +			smp_store_release(&bp->has_serial, true);
> +		}
>  	}
>  
> -	bp->has_eeprom_data = true;
> +	ret = 0;
>  
>  out:
> +	if (ret && ret != -EPROBE_DEFER && !bp->eeprom_error_reported) {
> +		dev_err(&bp->pdev->dev, "failed to read EEPROM %s: %pe\n",
> +			field_name, ERR_PTR(ret));
> +		bp->eeprom_error_reported = true;
> +	}
>  	ptp_ocp_nvmem_device_put(&nvmem);
> -	return;
> -
> -fail:
> -	dev_err(&bp->pdev->dev, "could not read eeprom: %d\n", ret);
> -	goto out;
> +	mutex_unlock(&bp->eeprom_lock);
> +	return ret;
>  }

[ ... ]

> @@ -2166,24 +2214,24 @@ ptp_ocp_devlink_info_get(struct devlink *devlink, struct devlink_info_req *req,
>  	if (err)
>  		return err;
>  
> -	if (!bp->has_eeprom_data) {
> -		ptp_ocp_read_eeprom(bp);
> -		if (!bp->has_eeprom_data)
> -			return 0;
> -	}
> +	ptp_ocp_read_eeprom(bp, OCP_EEPROM_ALL);

[ ... ]

> @@ -3757,9 +3805,17 @@ static ssize_t
>  serialnum_show(struct device *dev, struct device_attribute *attr, char *buf)
>  {
>  	struct ptp_ocp *bp = dev_get_drvdata(dev);
> +	int ret;
>  
> -	if (!bp->has_eeprom_data)
> -		ptp_ocp_read_eeprom(bp);
> +	/* Pairs with field publication in ptp_ocp_read_eeprom(). */
> +	if (!smp_load_acquire(&bp->has_serial)) {
> +		ret = ptp_ocp_read_eeprom(bp, OCP_EEPROM_SERIAL);
> +		if (ret)
> +			return ret;

[Severity: Medium]
Can this hand -EPROBE_DEFER to userspace?  ptp_ocp_read_eeprom() gets the
nvmem device through ptp_ocp_nvmem_device_get() -> nvmem_device_find() ->
__nvmem_device_get(), and when bus_find_device() finds no matching nvmem
device that returns -EPROBE_DEFER:

drivers/nvmem/core.c:__nvmem_device_get() {
	...
	if (!nvmem)
		return ERR_PTR(-EPROBE_DEFER);
	...
}

ptp_ocp_read_eeprom() stores that with "ret = PTR_ERR(nvmem); goto out;" and
returns it unchanged; the "ret != -EPROBE_DEFER" test at the out: label only
suppresses the dev_err(), not the return value.  serialnum_show() then
returns it directly, so reading
/sys/class/timecard/ocpN/serialnum with the serial EEPROM's nvmem device not
registered (no 24mac402, at24 not bound yet) gives read(2) errno 517.

That is exactly the "serial EEPROM absent" case this patch targets, and the
attribute is world readable.  Would translating internal codes to something
like -ENODEV, -EAGAIN or the -ENODATA already used below be preferable
before crossing the syscall boundary?

> +		/* Pairs with field publication in ptp_ocp_read_eeprom(). */
> +		if (!smp_load_acquire(&bp->has_serial))
> +			return -ENODATA;
> +	}
>  
>  	return sysfs_emit(buf, "%pM\n", bp->serial);
>  }

[ ... ]
