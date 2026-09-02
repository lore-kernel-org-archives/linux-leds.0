Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98644AA1D0;
	Wed,  2 Sep 2026 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365824; cv=none; b=ZEIy05tdftJWc6M2ujQrhEfH2JYMtPfcjPlc0KUkGLXp7QRcS69lNOOlIcta7JPPwaCA27C63Ag/yffYSMFBjMjuC33NokeSnfUWUTkTVB742nEb5Gyh6jjwTn/gQriFtpkwxfM9yDANsNteMZovGdles7o4ZsmKwoRBOh5vwbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365824; c=relaxed/simple;
	bh=BFqgs1sEwpaSwmZhZaYLoiATiuADXZEmV4WXbx39zjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMJ5TcKgtRJfDkco8nBT4dgJQwzAINwJd+h6farTXyCqaeZr63a+9COnggDQwLSE6SPDNWS8EKEVFDdG4YUJ3Uid48jdMvUFdz/0iSJtEl0hIh87UY/RAfhIb3QkdhFAYXwcnWQ67wO3/rhf7iicRZtpREQFeKGqoqWIOC73tCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbqlnNaT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbqlnNaT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8318A1F000E9;
	Wed,  2 Sep 2026 16:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788365818;
	bh=jGg2Irbhq0XgAPfu0BPxh3p9w4MW065BzhIbmJw/yno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lbqlnNaTCdHTa/jKn80cfqvf4yLqOY8Cb7Oj9L9e3v8aGq8ReX6tLGsmFCPsFVW8Z
	 M32O+Le1AtwqAVspl56SYyPDTdUBOFLbSV/7/hqtsnWSZrOcXNUJamLfZaE7XkyzYC
	 nBNf5bZe5w7fSOl1UwFFnuwCifXx+6rkJ1E/p2TET4ZZxe3whTRWoxIgBbIV3Idt/2
	 qUAPg4RoTp1a4ldF8ThH6ste7LxFgDUysuG98KHW/0mQ4ZYtxjC9O3C96ZkgLo5mxf
	 E9gwe9p1a065oBidbc3HST8S5vknEpPTvK5D8PWwIotjHuQxjPo4DN6w+MxwYL3SZa
	 sYF8OCXMOI8LQ==
Date: Wed, 2 Sep 2026 17:16:53 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Nora Schiffer <nora.schiffer@ew.tq-group.com>,
	linux-leds@vger.kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: leds: pca995x: describe reset-gpios
 property
Message-ID: <20260902161653.GB2133376@google.com>
References: <6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com>
 <20260902123759.DC6841F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902123759.DC6841F00A3A@smtp.kernel.org>

On Wed, 02 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [Low] The commit message description is not capitalized, violating the LED subsystem guidelines.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the driver validates the child `reg` property against `PCA995X_MAX_OUTPUTS` (24) instead of the chip-specific `num_leds`. This allows 16-channel variants to configure out-of-bounds LEDs.
> --
> 
> commit ead1262f70ad0044c0eca7c693a6d898fbcc4d44
> Author: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> 
> dt-bindings: leds: pca995x: describe reset-gpios property
> 
> This commit adds the reset-gpios property to the PCA995x device tree binding.
> It allows the reset pin of the PCA995x to be described in the Device Tree.
> 
> > dt-bindings: leds: pca995x: describe reset-gpios property
> 
> [Severity: Low]
> This isn't a bug, but does this commit message subject violate the LED
> subsystem capitalization rules? The description after the subsystem prefix
> should be capitalized.
> 
> This is a pre-existing issue, but the driver validates the child reg
> property against PCA995X_MAX_OUTPUTS (24) instead of the chip-specific
> num_leds:
> 
> drivers/leds/leds-pca995x.c:pca995x_probe() {
>     ...
> 	device_for_each_child_node_scoped(dev, child) {
> 		ret = fwnode_property_read_u32(child, "reg", &reg);
> 		if (ret)
> 			return ret;
> 
> 		if (reg < 0 || reg >= PCA995X_MAX_OUTPUTS || led_fwnodes[reg])
> 			return -EINVAL;
>     ...
> }
> 
> [Severity: High]
> Does this allow 16-channel variants to configure out-of-bounds LEDs?
> 
> Changing the brightness of out-of-bounds LED channels (16-23) on 16-channel
> variants (e.g. PCA9955B) calculates a pwmout_addr that overlaps with the
> IREF registers (output current control) for channels 0-7.
> 
> Could this cause silent hardware state corruption and potential physical
> damage to LEDs?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/6d3600f99c77c31166f0b6a5ccfb7f518b53c4c9.1788350618.git.nora.schiffer@ew.tq-group.com?part=1

-- 
Lee Jones
