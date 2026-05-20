Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1F63EA961;
	Wed, 20 May 2026 14:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288018; cv=none; b=cd9hgrSqffzPirdXgfkIE44m4eSXcvy5BOU/3W+uzbWZk97au72pGMjqgC3VkGSc4BlkYzx1HeF414O/BLsTOx+XE6JNl4MbWFfv8UB9FbbV9EsnKj35LBVelW+iqylj2U/huAdGA2FT6/TN6FmyXq/i/XE7Do+vbkw6rmbm8qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288018; c=relaxed/simple;
	bh=3pvqXK27qN+PIQVaQwfUXHS7mjwbRkCRNtewr/Gyx2I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oLrQ2rUHS97p6YusBdejJSTZOrvM8Suhm3SeU0bzA4gPWSsAXo/wC87tm8ycO5bbIYPsOYXCh8d/DEdbTGmkQg84/wbXGYDm/SJq1HNnUyEmZbjGqJjYSRBDMUFwVuDM/T4m6PqKelL0fvF9SNyMrpLBtGHX0+RyZDCto4BdXP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SeeGg82S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SeeGg82S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45041F000E9;
	Wed, 20 May 2026 14:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779288016;
	bh=z44B4pKlXtWMHeRUWbOBkLIBLTjIsAW+tf1YTZ4aK3g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SeeGg82S/X7t2Qu49HzopuqIci+oSF29fTzX26/hxeqpJOuVMwbMUTOO4NnZuhpLT
	 +WJeopmnzMmPd43Pu2aUAW9ZWEOrrL4U4nSls8pzHQp4ERAoL3FWDS7u+y+b4VDNxX
	 9fpGKV3NRReApMZ8Wy6ANZCk+mWrYMvmhlDSbK/SHkGdtEDkyJ0q7wAmaH8gPzdzCS
	 nJeiMy+/0S7eJSIWpjyr4569Tnzkp9VYcQ0UIVBSiEPsUIrEy0yDPoudB6m7GWL397
	 cuYpr8Hl8ZYEJgCzsottFAxvlMYcft9awFND4ioRpHF2wtj71K0Poulun12RrI/Os0
	 llEytgBtpSSLw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Stepan Ionichev <sozdayvek@gmail.com>
Cc: pavel@kernel.org, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260510003632.35942-1-sozdayvek@gmail.com>
References: <20260510003632.35942-1-sozdayvek@gmail.com>
Subject: Re: (subset) [PATCH] leds: dac124s085: declare SPI command word as
 __le16
Message-Id: <177928801545.2818962.8387522912021625579.b4-ty@b4>
Date: Wed, 20 May 2026 15:40:15 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sun, 10 May 2026 05:36:32 +0500, Stepan Ionichev wrote:
> dac124s085_set_brightness() builds a 16-bit SPI command word:
> 
> 	u16 word;
> 	...
> 	word = cpu_to_le16(((led->id) << 14) | REG_WRITE_UPDATE |
> 			   (brightness & 0xfff));
> 	ret = spi_write(led->spi, (const u8 *)&word, sizeof(word));
> 
> [...]

Applied, thanks!

[1/1] leds: dac124s085: declare SPI command word as __le16
      commit: e2e0784011e65dc2a0f83eed315c534a70ff5b68

--
Lee Jones [李琼斯]

