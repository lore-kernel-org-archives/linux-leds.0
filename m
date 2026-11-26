Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696181;
	b=nmPnuKO7qAs3IgHahplL9Okong1d9bfJASm8Fw8Y2dUtT4Q9xXUyseEGgLP4AawF/p55
	 9lMWcj41xcZ6JIXL/7y8f0+qd8NITk3aMGC4WqhSWKEwWJcHLU+PaIGCkWxYs0gAvzKtE
	 3v+5/TjN+RJpHCzZVKvVEpseabrMRBWc6nbFMQ9s9L5pqQ+qHUXiQf4hxup7wASHxf/SB
	 Yi0aKTTxnL20TnnMA+A02VFeBSCYAZ4JuSV9UEYaDt63mdXuFH6z2qzuZrU9F3/w/618M
	 GwHWWu+RqdJnt9GgpoC6ZAotOCqY4MF/gGuDIrrrdLwHZ1I1i9Hf6kffjYvRAzMSDHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696181;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=So4eG3NZg6gqKTehNkqA2oEDhNGd2SAeUdpsG9ueM0c=;
	b=1weAGJmO7FQBDMSNFmM1iPyw7m44vqJL1O0X0EnQcmF8ptaeBdUjswwWMcP14ekvelQ6
	 DCEGo6fTzykre/VPOW+razCYAGXp4yG6r0rffdX9M9oysNUwr0oGT+oYqtc4nIqUUgsSY
	 C3fVClhUGvaXqm70slg7w2xm27KJ5zbHfDh2+qp2ZBU8UShh0WxqSwUR7b1Ky98bmQpqo
	 LTGF/iCGkTqVDI3EhRudWIrWMp/HKjkf6kN3vEEQKdgj9DLFFGHjRtNzzq8S+yBeVvvz4
	 VYnXjf8rYXeg9vRk87kQyq3M9cXlygGR2z3aFFOZdYXYDH9Ax50EE0HyfO53MnNgJig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkhjxWOq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CF7606A31C;
	Thu, 26 Nov 2026 12:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkhjxWOq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7D11F000C4;
	Thu, 26 Nov 2026 12:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696181;
	bh=So4eG3NZg6gqKTehNkqA2oEDhNGd2SAeUdpsG9ueM0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bkhjxWOqMsluBMbefoWAyoT+tMJ32G5jKbr1SBPs/eM2PskeLpin53gzYLZ+u3VMh
	 FzAYqaHjLX+yoem1frirRpCEAe7jiFfOr5p3HORajpCe1OM8gsc/yZSPutA3zkFXGI
	 ARdZtJibgnjT+qhCCLskln+mkZHPiMHw2frl6zp2pSpezewK2NR4wy3PBjYyi0E5KJ
	 oMGUYginU6x62HNuCDPtZHxTcezcEFYoJ2oRTukwoiChcnGbnYlLI/PuQi9aVhaFhv
	 rJLnWxxggU04m68xIX5ZhZ7+EM/jtuQuWLBazHCHrdRcIPN/hA7roOHtkCy2hRvr7R
	 Qx+hBbcd11X9w==
Date: Thu, 26 Nov 2026 12:29:36 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v6 1/3] regulator: dt-bindings: maxim,max8907: Document
 LED support
Message-ID: <20261126122936.GH38590@joneslee-macbookpro.roam.internal>
References: <20261115090520.102216-1-clamor95@gmail.com>
 <20261115090520.102216-2-clamor95@gmail.com>
 <0670d537-0f9a-43dd-9d48-90272f04f1e2@sirena.org.uk>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0670d537-0f9a-43dd-9d48-90272f04f1e2@sirena.org.uk>

On Sun, 15 Nov 2026, Mark Brown wrote:

> On Sun, Nov 15, 2026 at 11:05:18AM +0200, Svyatoslav Ryhel wrote:
> > The Maxim MAX8907 PMIC supports a single LED; document it.
> 
> Acked-by: Mark Brown <broonie@kernel.org>

You should just apply this, I think.

-- 
Lee Jones
