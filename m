Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF7846DFFF;
	Thu, 23 Jul 2026 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805500; cv=none; b=IKipXb036ET6l8/GLuCIZ639MnkW3E8/uTygm5TFDZbCd6tYBqjWWH1OFelqiBGXF5IqNjr/iNL/eNyRAQ8gXGW7F7X2QepgBHE0FXAuZCgWEpVcghh/4xdiCP/YtuDNbXm3Ro9fZvzTDTmbsmxngw+bKaUmavUI3FpW4NeVznI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805500; c=relaxed/simple;
	bh=xA6h8zsdnaX+TM6BX4y+1bdb+WO3NhRSnDhwMvw5JWA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E/WgX010MHNttPcGc4w85eHCKGhav6I8trMRzUhCub1Y0mtVuRHn7ylaJCj/1VziNX9xQZQxslpHXvOw70qG5neCcYM6obIl+zd7xMMljSc3OfII2c2Ea+9Jg/AVLCu/dkIvj63ej22gAkLGw9wEvTfufBRiIEQ+1T6GGMjdo+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uo+fB922; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uo+fB922"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127A81F000E9;
	Thu, 23 Jul 2026 11:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784805492;
	bh=ExTSV7lRp5vBSXIfUcF2r6dTI+azVWTcAtt1ZPH9Rcs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Uo+fB922sAzNmaihDq8sVghUlYy/6B5tf14Hl4GJqwm5OXm8azGh/lZ1kSGT0eq8G
	 40/W4uprF/9oguObCj0myRytAXYMNA3bDI1VovD2RBGQFPicNUZd9MRuzugy+rDEOA
	 mG2tP+LB3sUN5GaRHuV/ApeC8iiojki6Dln/U0IrH975V9D2TEAZgl1VPxevnXOQiJ
	 98nBd4jwbt5BgXQhBvb54Ym4R2Y8W3fQHKufEgpZWKQZVsZVeGwvEzmo5lxi2opWlt
	 k5akrqmYnCp+1Tbc9ULkwSTffGmMRqMai7jQylPqoXKh7HPrKsoOxP8CCGyNtn/2E4
	 OSajG9TbQ7vlg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Edelweise Escala <edelweise.escala@analog.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260709-ltc3220-driver-v13-0-9b53237642eb@analog.com>
References: <20260709-ltc3220-driver-v13-0-9b53237642eb@analog.com>
Subject: Re: [PATCH v13 0/2] Add Support for LTC3220 18 Channel LED Driver
Message-Id: <178480548980.3362882.161757609550080567.b4-ty@b4>
Date: Thu, 23 Jul 2026 12:18:09 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 09 Jul 2026 08:41:18 +0800, Edelweise Escala wrote:
> The LTC3220/LTC3220-1 is a multi-display LED driver, which contains a
> high-efficiency, low-noise charge pump to provide power to up to
> 18 LED current sources. The LEDs are individually configurable to
> 64-step linear brightness control, blinking and gradation control
> via 2-wire I2C interface. The blinking and gradation configuration
> is shared across all LED.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: leds: Add LTC3220 18 channel LED Driver
      commit: 3c28d9d0b7e0890df3c16dc7ad5f0fd17e775ab4
[2/2] leds: ltc3220: Add Support for LTC3220 18 channel LED Driver
      commit: 07e028d93a57fa6217cf8eb1375ec29e7d1e4b27

--
Lee Jones [李琼斯]

