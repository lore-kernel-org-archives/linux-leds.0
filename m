Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582987;
	b=Ijv9D365/pJK+mI5zKtjAhFgIk+3laf9alD9I2yh/K5GIL71Xj9qiYxwCzrQhUn+UzTG
	 6Z2N2MgI5TuxO01Asql8bwvzXy3RG/nzbzVk1AIZulpBCz+dqbB5ZHYISUAj+K3WoY22P
	 Ixo3oAARqezAc401v0/xAtGUXr6FBjE0ogy7Kv3XjRHv3iPH/5giYaoUIBpND1CO0Vshg
	 1x40eOPwR3TWzm7+WLEu0WwoOmzA0HzPspf5jxvgbb4W3RX5od8QUBNFpD0Rwer6a22UX
	 ZfOMCjXpKY3GJ8xdwgShkGVF8m/sRnszfOmjVNbCc0y7hODKxLi8KSGjrw/YipwWGiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582987;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=ktnsD4SbfZG5fT0ARspw7vKZ7u9IS5o+7RTlylOq7n8=;
	b=XWUXnOIO2D/dmGNKiDrMILhQvHENCFsjfNMaiypQG9docfwAfq+lv35W5RmiBO3Q1BrR
	 WI7wpbTEN9X3/aCgn957MPIC30A/GqLWDoro/ou/renQqCP4SmwqwnA5HJlkXNqcf0DLT
	 hCwiYki8zFEL8SKmQA7DEiXvHrjvqoPYau3wzQAvwgv9L/f3VPCincOlAkS8KTZHkp5S+
	 n4TLiaaj6JpgzDDHe2nkI7ftryUXYz08dhG+1LTxLhUocVW2ecN5YqkWl2/u4ytSSOpYa
	 OKEAlRrcD6UUY0vBnC6YMSrIRCE/+qOdwdNrC5eQBbaa1TE+hl932R9BqxwfvgE55YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bjxVhsbT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DD3606A33B;
	Fri, 13 Nov 2026 15:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bjxVhsbT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04241F000C4;
	Fri, 13 Nov 2026 15:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794582986;
	bh=ktnsD4SbfZG5fT0ARspw7vKZ7u9IS5o+7RTlylOq7n8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bjxVhsbTKKdKLiB8eDSW+qOk+hPjLfwZgnaOExWjpbbZ+1rq/NmjxExC/ugoRFQke
	 MbL523e5h66zdzti4yndJ43geSb7EDP4snVVG1Jy5qeaaEKGNV15ahvGGdi1pyfkg+
	 tKvel5C6MPg/fzFFGM4OPTpRtjF2utN5or7qpSzQ19qRuZAmolFV4zDEC//7E7zNfq
	 OlKvrWLkUMrp0/8YjIHK4LcvpeaIgLcx2hnsxT/zmlNTAnzAVzwBTGY6I7AtMGwF7Y
	 HpTTUzxldC0DK49OLn3575DtCBRgFGAo+jA3fyCJRKMX2zuhC6DbhMEynAOTRZQXmk
	 gxzmVtj6S/71Q==
From: Lee Jones <lee@kernel.org>
To: Sean Young <sean@mess.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: linux-media@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102-6768-irled-v1-1-c7064f3afed1@protonmail.com>
References: <20261102-6768-irled-v1-1-c7064f3afed1@protonmail.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: leds: irled: pwm-ir-tx: add
 power supply support
Message-Id: <179458298352.73259.16790444663025222206.b4-ty@b4>
Date: Fri, 13 Nov 2026 15:16:23 +0000
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

On Mon, 02 Nov 2026 17:22:56 +0200, Roman Vivchar wrote:
> On some boards, the IR LED is connected to a switchable power rail, such
> as an eMMC supply. If this regulator is disabled, IR transmission fails.
> 
> Add an optional power-supply property to document this regulator.

Applied, thanks!

[1/2] dt-bindings: leds: irled: pwm-ir-tx: add power supply support
      commit: 3aec3445e63e3bc1cfd7c198b903d01b5bb9b27e

--
Lee Jones [李琼斯]

