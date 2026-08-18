Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2435E47DD73;
	Tue, 18 Aug 2026 16:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787072248; cv=none; b=gy2xHv+kB+T2FeliYj6qjimewetcibBa53hpPAYcZYEqyZ/3GRdKabvmN4tIk/Za64by3N4KBGY4eXxgMwKqvn51wT05G30rrc/N4AnXfv2NH6BCxf6IDBqyGpZGMV1IGt1H04wC7/sbe/Z+WxyMuc8Xku/MF+GrlZs/T63UmYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787072248; c=relaxed/simple;
	bh=kYenyZedqNIx/VrgNyZ57w73bhgpE9N1UgQKemFqz10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0UtRnUcUwSl/YWvj/Ww57fwoiebNI7QpWFV4crb8giii0YCf4uQltBMD9WDBsOJ17IWtXQbb5U16T3anyJCsKxU0/5OGkw8IztwO9twtxTegBVWERO1bZDbjXLrul8l3q6ww6aApdevSEXA2KBAQ3kd0DbbAyl7KfLSIZrHKe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXCiZUfr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXCiZUfr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23FDB1F00A3A;
	Tue, 18 Aug 2026 16:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787072244;
	bh=760co1SwK/G7rs8+CRyGLYh22qgIjgF+4ny5f+i5sFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FXCiZUfrJyPCOisYdcr/1EE6h/oLXaRE8SZhEKVxMqiJCBIX5x7LiiGLvkQkSmX1i
	 75xi0TIGmpMJzUiDD7Ds9ETMRAnDu9HVq7O0OOBHY3hs2JiNZ2iKcGnkqtUIq8kYDX
	 PYaKfLH3++PtHkeWRjvyWfVAFW7jVgzFplJz+mY2Y9MnYqpHiyNzVV71v7jGD5vlcT
	 N3S/eNvwdcCrR03BaxoPeeGXjpEInhduE3CgiQGsQwPyupHgZjhfH4ndBvvU/xQxp4
	 fc/UeJ6xI6Op2C9qn2xFaLtroeKf+tfLuWN9YY7XBaKmSOyM5E6IRieQGhWKmntSWi
	 x85gJgzLlSDoA==
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
Subject: Re: [PATCH net-next v5 6/7] ptp: ocp: Add R4006 I2C peripheral topology
Date: Tue, 18 Aug 2026 09:57:22 -0700
Message-ID: <20260818165722.4008512-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c6f7d14b58411e4513d5b89472459369edc8de4f.1786747084.git.ahmadexp@gmail.com>
References: <c6f7d14b58411e4513d5b89472459369edc8de4f.1786747084.git.ahmadexp@gmail.com>
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
ptp: ocp: Add R4006 I2C peripheral topology

Adds an I2C profile describing the LM75B/SHT3x/ICP10100 sensors and the five
IS32FL3207 RGB LED groups behind the PCA9546 mux on R4006 boards. The board
ID is now read independently of the serial EEPROM and used to select the
profile.

> diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
> index 444b26a5e2a9f..5ae50ad83bdac 100644
> --- a/drivers/ptp/ptp_ocp.c
> +++ b/drivers/ptp/ptp_ocp.c

[ ... ]

> @@ -2496,13 +2575,29 @@ ptp_ocp_i2c_populate_topology(struct ptp_ocp *bp,
>  
>  	if (!READ_ONCE(bp->i2c_root_present))
>  		return 0;
> -	if (!ptp_ocp_i2c_supported(bp) || !bp->i2c_profile)
> +	if (!ptp_ocp_i2c_supported(bp) || !bp->eeprom_map)
>  		return 0;
>  
>  	adapter = ptp_ocp_i2c_root_adapter(i2c_ctrl);
>  	if (!adapter)
>  		return -EAGAIN;
>  
> +	/* Pairs with field publication in ptp_ocp_read_eeprom(). */
> +	if (!smp_load_acquire(&bp->has_board_id)) {
> +		ret = ptp_ocp_read_eeprom(bp, OCP_EEPROM_BOARD_ID);
> +		if (ret)
> +			goto out_put_adapter;
> +	}

[Severity: Medium]
Does relaxing this guard from !bp->i2c_profile to !bp->eeprom_map change
behaviour on boards that are not R4006?

Before this patch nothing ever assigned bp->i2c_profile, so
ptp_ocp_i2c_populate_topology() returned 0 immediately on every board and
the topology/retry machinery never ran. Now every device accepted by
ptp_ocp_i2c_supported() (the Meta and Celestica TimeCard IDs) passes the
guard, because ptp_ocp_fb_board_init() sets:

	bp->eeprom_map = fb_eeprom_map;

so all of them reach the new unconditional board-ID read.

What happens when that read fails rather than returning an unknown board
ID?  ptp_ocp_read_eeprom() returns -EPROBE_DEFER when no nvmem provider
is registered, -EOPNOTSUPP with CONFIG_NVMEM=n via the
nvmem_device_read() stub, or -ENODEV/-EIO on a bus failure.  Note that
PTP_1588_CLOCK_OCP selects neither EEPROM_AT24 nor NVMEM, so a build or
configuration without at24 is an ordinary case.

The error is propagated through goto out_put_adapter to
ptp_ocp_i2c_work(), which hands it to ptp_ocp_i2c_retry():

	if (retries >= OCP_I2C_RETRY_MAX) {
		if (exhausted)
			dev_err(&bp->pdev->dev,
				"I2C topology failed after %d attempts: %pe; "
				"retrying every %d seconds\n",
				OCP_I2C_RETRY_MAX, ERR_PTR(error),
				OCP_I2C_RECOVERY_SECS);
		delay = OCP_I2C_RECOVERY_SECS * HZ;
	}

	/* Preserve a faster rerun queued by an I2C bus notification. */
	queue_delayed_work(system_wq, &bp->i2c_work, delay);

There is no bound on the recovery re-queues, so a board that will never
have a profile ends up logging an "I2C topology failed" error and then
re-arming bp->i2c_work every 30 seconds for the lifetime of the binding.
Would it be preferable to treat a failed board-ID read as "no profile"
and return 0, or to keep the early-out tied to a board that actually has
a profile?

> +	/* Pairs with field publication in ptp_ocp_read_eeprom(). */
> +	if (!smp_load_acquire(&bp->has_board_id)) {
> +		ret = -EAGAIN;
> +		goto out_put_adapter;
> +	}
> +	if (!bp->i2c_profile)
> +		bp->i2c_profile = ptp_ocp_i2c_select_profile(bp);
> +	if (!bp->i2c_profile)
> +		goto out_put_adapter;
> +
>  	ret = ptp_ocp_i2c_init_nodes(bp);
>  	if (ret)
>  		goto out_put_adapter;

Related to the above, the commit message says:

    while unknown board IDs remain untouched.

That holds for board IDs that are read successfully, but could the
changelog also mention that the topology and retry work is now entered on
every supported PCI ID, and what happens when the board-ID EEPROM cannot
be read at all?
