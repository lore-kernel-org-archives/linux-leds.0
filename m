Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053CC402457;
	Thu,  9 Jul 2026 09:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589351; cv=none; b=PGLwEtUmqTNHIAdDamT6VrjigmhlZTA/VbUACTvDJXUfmC1LjJ5B8I5fT9YmmJfEzYLjoj3zWdWHMNQRFomX5DtOtypVfSvOw3J23HLSj+n8xP4GMD2lQK2r/6gPDVcv0wJZixfdq1SSnoD9n3ff3sj7JjWc4LSjrBYqBh44JLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589351; c=relaxed/simple;
	bh=qh0SAu6PH7VstHXkvH8kryFVjZSe9yQjji0VRvtX7kc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=pht2eVVo6N1eJ/1+soK5RkEWhq94+lrUlX9MT/TCbh+YeyYfdlv2yabFB2p9YCODEWH02S4qQ/0aSJVitYtSuIy8aRqTjEsULd2rh1Xy6w2LPTZqt18L11D/kd04Q+25sUQa6mp/aw/wt+0YDuwNvt5wYQXq+0w8rH3gX1LqGbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0R8lA+N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0R8lA+N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 516851F000E9;
	Thu,  9 Jul 2026 09:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783589348;
	bh=Yw7EceTiOvO6S4OUvk0oO2dGawh/ZidrcCAXrTYhK2g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=n0R8lA+NjJEaxVZ1UXHBkio6OWazq1b0XXps3yXJuv6Da7XkmiWDVvqWyGtl6+eyk
	 jZ/qk60IE/XMCwhsFcGTPf/tnOgL1KMQ6sAHKuNhrxgBOy4axoDjD39aq0C/ABlvp8
	 W0mwWxvrOg6T2PtqiMfRGcv13ZExcynV8WUKjrMOEfI1L2eSSDINnil/rB8a6fVIh5
	 rT0w00Vnu44JxG1xprkDPb4kUux1l6N4ebIrngYgUZUxxhFipAZrxKrPIr3gybt678
	 ThFK0vZb3GBqszBhMuQjVIAGfojJY1DyiCj4yLSIoEM3AvAYEgwsUfMKuGbQ7GVI7g
	 U0EqQKrOE6LtA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, riku.voipio@iki.fi, 
 Cosmo Chou <chou.cosmo@gmail.com>
Cc: linusw@kernel.org, brgl@kernel.org, linux-leds@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 cosmo.chou@quantatw.com
In-Reply-To: <20260703014201.69829-1-chou.cosmo@gmail.com>
References: <20260703014201.69829-1-chou.cosmo@gmail.com>
Subject: Re: (subset) [PATCH v2] leds: pca9532: Fix inverted GPIO output
 polarity
Message-Id: <178358934604.2058230.18323770396680344580.b4-ty@b4>
Date: Thu, 09 Jul 2026 10:29:06 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 03 Jul 2026 09:42:01 +0800, Cosmo Chou wrote:
> The pca9532_gpio_set_value() function incorrectly mapped the requested
> value to PCA9532_ON and PCA9532_OFF, inverting the GPIO output polarity.
> A requested logical high (val=1) incorrectly enabled the LED output
> driver, which on this open-drain device pulls the pin low, while a
> requested logical low (val=0) released the pin.
> 
> Correct the mapping so that val=1 yields PCA9532_OFF (pin released /
> high-impedance) and val=0 yields PCA9532_ON (pin driven low).
> 
> [...]

Applied, thanks!

[1/1] leds: pca9532: Fix inverted GPIO output polarity
      commit: 65a38a28a0b04af19a5e1fbf3869051412eeac96

--
Lee Jones [李琼斯]

