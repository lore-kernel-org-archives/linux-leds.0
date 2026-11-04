Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790625;
	b=ggAp5ZmZ9aRkGRpWhiGgLgICyiPNUKyVKK+QXKjGM3+37FXnJnoTYhi7O8MNQWUlUDEh
	 ZUTQ8ypRucRUYBJq1Kijlkvkw/L9L3gVSHDNpxRlYOWhh007WxqRSaXdSky+jWB00Gx0l
	 CEzND2MR1uMKoARVDkEotS+yxNBz48eLws3dZu71oH6GgbyEa3+OOLdVVtnXIhZuXu0Kl
	 8sgtd31kvWnZN5fBOxwPg7l1ikitNA0Afi7nwFEvQr1ZvcGEzWp6paSeqTRntqL5dvM9R
	 7bHEcgDeFUDsyJ/iafwDGwbs5FFlImojtBhq7b4hDQztWvCJBEzkA/qrONrTcr39ErQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790625;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=lAHJ8FHzVR1sD93SV5yiYybKt1rftqUbw+Pl7sCivxI=;
	b=B+47nefLOftv+lSwKEuVBh40/5x+cG2FUFmDP2M9qK8cVIu3vhwv7rJECYfhSM/+dlZW
	 Msgr11JNjCYS1ut3I737zbdrPmavBgjMjAHFXyX88JNB2/1LTaCw2gbrIE65OvJ+NfOTb
	 HMfPWVNSaZaLO/9ToW3HqKfRRaymzuHY09MMpm1l7+xiMGW+1uROxgVMyuhYUaCO8BOlC
	 fnBNj7+RaLLsqvVJtBEQpjkVEZYqdnaAjX/rFv8E6o57W33p5HPardS/7pj3k1ztQPBzz
	 gMp9t9462/sL44V/zWwEBoQyGzptUGrOYIQHewIqVsXrKRh8X5QoCZQo/sMWkHNcGhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAlCNFUq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49002606D821;
	Wed,  4 Nov 2026 11:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CAlCNFUq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B10F1F00A20;
	Wed,  4 Nov 2026 11:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790625;
	bh=lAHJ8FHzVR1sD93SV5yiYybKt1rftqUbw+Pl7sCivxI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CAlCNFUqkCkECw2nQdR+3soqjExncUIQ9s90lzgqwFsY+8UR/68m69X/SqNq284R9
	 k9za9LZq4aowUYRVrt2lQDHplRHZXdPJhgNZunOCgjatihJzO4bb4u3/afq+XSqs/A
	 96UtHi2T9cohUBBsd34FuYemauSDz1HuUE/BmZRtPvvFx0xNuZWOas6jwADcYqutuc
	 ZGurARcXetQxaLQTmSmrCiamRFx62qMdXRAUaB5Ez/lTHFSP9URxD62gYJBXxOyDQm
	 L6660WvoUsaPZR0pF3gtjvNOINfwobVovbOZw4Xy9m2dsfhRWThC7enipLOrWfk8Au
	 dIR4k6hA2Z/cA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Arthur Crepin Leblond <arthur@marmottus.net>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
In-Reply-To: <20261026-lp55xx-v1-0-6eaaf530115c@marmottus.net>
References: <20261026-lp55xx-v1-0-6eaaf530115c@marmottus.net>
Subject: Re: [PATCH 0/3] leds: lp55xx: Fix the LP5569 LED mapping table
 placement
Message-Id: <179379062298.1650112.8400326668494176889.b4-ty@b4>
Date: Wed, 04 Nov 2026 11:10:22 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 26 Oct 2026 14:55:38 +0100, Arthur Crepin Leblond wrote:
> The LP5569 and LP5523 keep a per-engine LED mapping table in the SRAM.
> The table is read by the engine's map_* instructions.
> 
> On LP5569, the instruction loads a table from a 7-bits absolute SRAM
> address (0-127), therefore the mapping table address must be in the
> lower-half of the SRAM.
> 
> [...]

Applied, thanks!

[1/3] leds: lp55xx: Add program and mux base pages to the device config
      commit: 7f61431969de5c32aed924a9e4545dca5f39c110
[2/3] leds: leds-lp5569: Place the LED mapping table in the lower half of the SRAM
      commit: bd92a3d61dad4e71c0e3cf820fdf483e97f4d736
[3/3] Documentation: leds: lp55xx: Add an LP5569 example
      commit: f9a336bbf1e74ead4fb8082dca8e7ac29f5adb1c

--
Lee Jones [李琼斯]

