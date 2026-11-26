Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696321;
	b=Mrw/lGnRV0rfu457EQMkzodVJr2a9ZEam586QFMup0B09tui5ActrmxTKobpm1TA2LvL
	 qrobKuA2Fz4do7aHz/E3xtqy48cek+7X50Y3DmHsFcQKt3dP0agCNIKIZLZZ6rUAQNA0w
	 flvKjiFJ0UJX/AVNRF/CVPH3zKLNedFQfkC6TktyOMpYHsjyDWDzshnqHBJvNdpoBy+w4
	 ItpPb2WTZEI67e0E6Ey0+nZVmYabfA7ZLj2JzoerTwjxA2skgJR95hnumAnvhaRaEncKo
	 YLhAu/J/Xa6l4bM0YQJqszPJx48549PvnIIUlq4qvphAYxrDwC4s2WOZwfcJZxLJwdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696321;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=iKi+mz73qTP5awVuvmBgueos1lsnFXCghZ17RtqY+X4=;
	b=i1cYugLJ6EoJYmg95xX2DKmuaDyD4YgCJO3rccuxHbfCC1bow9N8qayKIp7m8Hcj2z9c
	 MjI0Nc+rL4SE+HnAAeizmEv8BPBehHYzYeHVkLLqFf7gKS6kzTynsc/zvktxi3dvJFq3k
	 szLThvaZcMxWF9BF1IeRUYGy8cASg9nQ4sy6FRFEnW9ysvk2JjvIp5d7T6HUlg4hSxIsa
	 7AI2v2ntNN2VL4qcqqfjznYBhCkwk//FavfBqdQ2NzhhYWoE6fsvkXCSh5sphYkr0TNpT
	 CxPhZIAObXGtwo2MJFmi4ciaNZXXRgNtAEFqBCmr/ucjk2ufoaggNAi9S8O0ST2noEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2Ad2wQO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BB3606A31E;
	Thu, 26 Nov 2026 12:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2Ad2wQO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE4D1F000C4;
	Thu, 26 Nov 2026 12:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696321;
	bh=iKi+mz73qTP5awVuvmBgueos1lsnFXCghZ17RtqY+X4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Z2Ad2wQOqxc7RYxajLiSFYY8BFe6gGRF62MU5otO1gMhpMt1LaA9fDKjblTdsRCSc
	 /APSDZNK2GCDQhsrzqI8vu6wOu6oN7WNMkjAuXysHTUA8FvgH4uGEYcN06yOnyDRZJ
	 jdPTWMy+LPJ0nYxdz+J7XEthPhkFnxcpS6F8oEDP2v/ScP+d9cSwFqdT3J1amneY3S
	 ZsnBGTYRhu+Ti+sZXHds17gOVQbxs3WOasJfZSBNAoGhVljpVUe1Iy6wGSz/fDFKhc
	 sp0tm5QpFA6hKNhzYUDbsnr90VeoEabHhAGi4IgeovHQzzKMjfIMeoXe81yk1G0GQf
	 PiD7IPascRNkg==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-leds@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261115090520.102216-3-clamor95@gmail.com>
References: <20261115090520.102216-3-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v6 2/3] leds: Add driver for MAX8907 LED cell
Message-Id: <179569631921.65470.15299872553514306772.b4-ty@b4>
Date: Thu, 26 Nov 2026 12:31:59 +0000
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

On Sun, 15 Nov 2026 11:05:19 +0200, Svyatoslav Ryhel wrote:
> Add a small driver to control the LED cell provided by the MAX8907 PMIC.
> The LED node is a child of the PMIC node.

Applied, thanks!

[2/3] leds: Add driver for MAX8907 LED cell
      commit: 7c804d7bde4a002a676509df6d1474f1d2a2434e

--
Lee Jones [李琼斯]

