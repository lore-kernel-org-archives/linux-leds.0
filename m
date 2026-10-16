Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEF93988E3;
	Fri, 16 Oct 2026 08:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792138578; cv=none; b=QU05o+LXS1p/04+tqRhN1z9/pJ5NEj9HOx6lbBIMiDD0DEF88hgLxcuRCEvh3NaEUFiDcZzOTxf9OZX+IN2pZdIh+7ayzLf+M48UuBM6mtshcv/n7wy5wfgwpuAbB/BxhXPUWgrd6vj8Le5nmscN5QlfMJSMlh6NXeVVQa3ZMZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792138578; c=relaxed/simple;
	bh=v4b25STYzExUB4CgTbGnnseMgcYhGzvLvYJY56DZNqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLxx1i6b0pw+3kHaue9BLszSRsK6o5zN1Wvi7ikc3llqRYOytj6cIq0podfjgi61BIV9mNjBTbm1iefuhs5PiersdumLvSrxyA1Kuknukw9vChQv+4GhnzMX7xUZ1rhDn6zMFqsNo6YmcHl4XYSfC499xmx1gDwNARp13Exdhd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHf4jric; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHf4jric"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271F21F000C4;
	Fri, 16 Oct 2026 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792138574;
	bh=Z9/VuixvD7efBDyaSXMAmmQZz0Nx6CDhSPtZF1e3b8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gHf4jricOYuY4HFxwOXHHQCAH+C+wf9EBZ3AcHEENw/R9pa6ge2HPBarJDtcIYdrL
	 wO1LIQ1cIrX5T9JA2vwCi2ZsacR+Mg3GX7C6KDswaHjziICJSeG7C8lqvH3wlvIGqa
	 D803r1mA4Jcbk4jW07JtF0qNJSelZCu2SunX/3EhOrElt88/QDT2Iv75rwt/jShPj6
	 kDB2Np/cydNHbmsvYJk7lLOIzBYjlJAfZceb43dY7So0nqCT81quHWk82xh9yqjT2+
	 VLSaAX4UEVNHpSsKx+iVeOUPqqwNV/IwR/J3utU/cy4tAREoKsY1YMRGv2SzXivnVM
	 I9GkxH0/TvWgQ==
Date: Fri, 16 Oct 2026 09:16:10 +0100
From: Lee Jones <lee@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: is31fl32xx: Fix NULL pointer dereference when
 binding via I2C ID table
Message-ID: <20261016081610.GA2663669@google.com>
References: <20261005194923.161411-1-rosenp@gmail.com>
 <179198424632.839288.1637324900719734962@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179198424632.839288.1637324900719734962@kernel.org>

On Mon, 05 Oct 2026, Lee Jones wrote:

> --- checkpatch.pl: clean (0 issues) ---
> 
> On Mon, 05 Oct 2026, Rosen Penev wrote:
> 
> > If the device binds via the I2C ID table (e.g., fallback matching by
> > node name, sysfs new_device, or software node),
> > device_get_match_data() in is31fl32xx_probe() returns NULL because
> > the is31fl32xx_id table entries have no .driver_data.
> >
> > Without a NULL check, is31fl32xx_parse_dt() will unconditionally
> > dereference cdef when checking cdef->output_frequency_setting_reg,
> > and is31fl32xx_parse_child_dt() will dereference cdef->channels,
> > leading to a NULL pointer dereference and kernel oops.
> >
> > Add a NULL check for cdef alongside the existing child count check in
> > is31fl32xx_probe(), returning -EINVAL if no match data is available.
> >
> > Fixes: 2779f4724b2f ("leds: various: use device_get_match_data")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  drivers/leds/leds-is31fl32xx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
> > index 285085d27453..7bb0295b0b49 100644
> > --- a/drivers/leds/leds-is31fl32xx.c
> > +++ b/drivers/leds/leds-is31fl32xx.c
> > @@ -577,7 +577,7 @@ static int is31fl32xx_probe(struct i2c_client *client)
> >  	cdef = device_get_match_data(dev);
> >
> >  	count = device_get_child_node_count(dev);
> > -	if (!count)
> > +	if (!cdef || !count)
> >  		return -EINVAL;

If it's possible for devices to be autoloaded via is31fl32xx_id,
wouldn't it make more sense to populate its .driver_data instead?

Or, if that's not possible for some odd reason (which you must specify),
since this is an || it's odd to check the return values like this.  It
more inline with current coding guidelines to place the check below its
caller / allocator.

> >  	priv = devm_kzalloc(dev, struct_size(priv, leds, count),
> > -- 
> > 2.56.0
> >
> 
> -- 
> Lee Jones

-- 
Lee Jones
