Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718703;
	b=QmdQagXRQtHEM5ryQ4rW3C2FvY1SD9q8UBmfZVCegI2Dojb5aI1IA4DVkDep74MymKQr
	 CDS92rS5rjrhpxVzUW0Y5ewebkjvc9eEc6NDdaLZKSGJJp0BIYgXnCkaYnwS+Zk9ldawU
	 taOmKwIm+ZaWumKooBVUy9HNbBTLXnPDtwQtw8Q4pflNPDDuUVOuN0eedEufB0el6ifiG
	 EEE5LvefJiCNE9UMYvu4QN//8rIrRbbvoui0cL5KS+NwcJtmdqg1Tv2gsZ/lzs1R1qPzE
	 VdjH4vmn1akml0P369cxooGmTjFItra4Kd2WEGepoxP67AqIRhDeskFSuGqfcAf6DAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718703;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=UdMHjFPXJJrOrrwljUnr0nEBylcGGVYPHeklWRy2SEk=;
	b=C9T7Zev1gfET662VLbfe9rFSOkufXxEL65aQPaB870gtgIABpy6E2Tg0kolHZVrk5fz6
	 uccsUWEYfUiI25iWGBGi6QvzGNROgGSTbAR5Jr1VpxCFEfdnCnQOn1I8maIj04kTj0Dhd
	 GdHe0w7o4bXKT5HZY56jqsdPhw2tLG2sks9YsUN1D89LImPxJ8IBCBnqdHgYnWCqZ6U14
	 pD3wcwQkqmyDAEEGveieThfG0GpjugVd1eHMI+kmXOzMCbGh4jUzpoh0W59j6q1Dg4eCz
	 aN6h+5UJ7YBWruuUcaCoVdmS80f7oL8p1Qv2LLuBrzY+3BV2B5J98hlOY61QrbZingg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="h/OXOaDt";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A645606EEBA
	for <linux-leds@vger.kernel.org>; Tue,  3 Nov 2026 15:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h/OXOaDt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA03E1F00A02;
	Tue,  3 Nov 2026 15:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718703;
	bh=UdMHjFPXJJrOrrwljUnr0nEBylcGGVYPHeklWRy2SEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h/OXOaDtrVfpSYzl4lyKFfuro1J8MswWdqz4FId3Bvxi+CjtrQPhFDdaN2WwCPp19
	 7hPqXqGlFO0McxkT8+GQC74XdKZ6SsuxjgnZv1qYSEcr1vUhY/rBO8BsNEuyBNbegw
	 KorxmU5wwzdTulZv7sXyMnQmGBM5ro5lS/aZMUW6JXD2+5tiVoBCyjXvMAlFGP2N68
	 Mb4qs2JTScmUODOeOHLLoomi4TujPMDL/C5ra+wL578v8Ur+AKeZZnJKuH+HL8dMVL
	 iYN3ndyU91ergdGOqehwdXNPhhNhnOGYtm/bcV7u/aUlhoorptJs996gmXHkK37LUw
	 n605PKn1PoRmA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, linux-leds@vger.kernel.org, 
 Felix Radensky <fradensky@nvidia.com>
Cc: vadimp@nvidia.com, griffin@kroah.com
In-Reply-To: <20261021142824.603605-1-fradensky@nvidia.com>
References: <20261021142824.603605-1-fradensky@nvidia.com>
Subject: Re: (subset) [PATCH] leds: mlxreg: Fix missing fan LEDs on systems
 reporting a unit count
Message-Id: <179371870171.1078199.2514810766112803326.b4-ty@b4>
Date: Tue, 03 Nov 2026 15:11:41 +0000
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

On Wed, 21 Oct 2026 17:28:24 +0300, Felix Radensky wrote:
> LED platform data is shared between systems of the same family, and the
> driver registers only the LED instances that are actually present on the
> running system. The platform data entry names a capability register and
> a bit in it, and an entry whose bit is clear is skipped.
> 
> The capability registers are a single byte wide, so a bitmap cannot
> describe more than eight units, which is not enough for systems with ten
> fan drawers. Recent CPLD revisions therefore report a count of the units
> present instead of a bitmap, and do so uniformly rather than only where
> the bitmap would overflow, leaving no per unit bit to test. Platform
> data describes such an entry by its 'slot', the one based index of the
> unit the LED belongs to, and leaves 'bit' at zero.
> 
> [...]

Applied, thanks!

[1/1] leds: mlxreg: Fix missing fan LEDs on systems reporting a unit count
      commit: 68a2bfdf7b4ddbd58bee808b68d8175e30431dd8

--
Lee Jones [李琼斯]

