Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495447;
	b=eTTlUDt4rCPbKnzH9h7V4C6h+uNqH/+4RRSnnPkLuBrmH7tbprL9+K/7CWD8FViHb0KY
	 d3GP9eRDADpIZ8dxSE1a1fhefMmqenaPEbx5M+TuUazQ852CdozTky/pxOlbKq5d62wyG
	 U7sR9WzcVNOMLjjQ2oIeNNj9gTW3Ac8d7psAFiUoLt6d2jYYjEruIsxMOr7vg+dBofkyy
	 wVtzdNhKbwPh48Z8jpr7o+Wko05PvLv2xOALAV+bfge2wjoEjkbvgp+zdTugMTCLYrh7v
	 p85DUTcdQmHMUv+fxAiKM9NvhazIwTM58BSRJLwynwkBDLD5O1fYChKm13C46NX7RSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495447;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=Ux/VRwVLa3G6qJ7mYxcImYPhsAeqaZtgWCoOJwEhM3E=;
	b=O/lC0i7uMXZ9CnLrKOx1HMrSrKZjsLSObF1rNtTbdDNJANnlq4eyvne5Rfrxxavym9Mk
	 8zoTwkOruQDZ+Guwq5Sp+7Mz87tC2wgPs4MEQYcmIaU/LqMzbHBzeQf5voM3l0e3mc9fY
	 QTFgspSK7FCEuSgAqL68nyFe58xMiAXkrsqrA4QLRTw6YNp9TTURj1o+QNinnTqnujjhu
	 r34IDCaTqLCkCwrGBJt8cFmYDwyYOMITLXFSz+QDf1wvecVlRrlv41Hg+sPXYx6pKalF7
	 eq5DU1inUvbhlSKPrsCPGWspDmUh/hTWfGFfg0gSv3WrGHd+7tRC6n6KVeuJb50gtPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hoqykk03;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD19606A31A;
	Tue, 20 Oct 2026 11:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hoqykk03
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E331F000C5;
	Tue, 20 Oct 2026 11:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792495446;
	bh=Ux/VRwVLa3G6qJ7mYxcImYPhsAeqaZtgWCoOJwEhM3E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hoqykk03cXr4E3eGH8T/nByTP3MQsPFQqskQBWD70/Xv0J30G6Y/nbg7fuFKX0UAb
	 M0XLkH6Wxv1vW/Jr78dUEwH/rjh/iMlC9dftzgnWZc8FtpXw12k3kn2TFulN9YTFYL
	 YS9aW9vnCMvCHRnFzNCadsP0dE5cEghBMHD6agA1vOBErrWgoJFuOLb4SePKHz82M3
	 hBuMQltTQq4HJvwKAgp5vNr6V3gWVPm+e93if7bKtEDJuO2PW7T50+iQk89HoA8I0N
	 zBTPYW+AE0RCS8W3Hi9QYNDcPrgYHjqrr9A4JPEv8a/fEvLC4nL74X77t1hBvHwpNA
	 b+Zt9CUKLLDAw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees+treewide@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261013181803.496627-1-clamor95@gmail.com>
References: <20261013181803.496627-1-clamor95@gmail.com>
Subject: Re: [PATCH v2 0/3] leds: aat1290: Add support for AAT1270
Message-Id: <179249544365.1830910.16989533900579942396.b4-ty@b4>
Date: Tue, 20 Oct 2026 12:24:03 +0100
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

On Tue, 13 Oct 2026 21:18:00 +0300, Svyatoslav Ryhel wrote:
> Document AAT1270 and FLINH pin, adjust driver to support AAT1270.

Applied, thanks!

[1/3] dt-bindings: leds: skyworks,aat1290: Document AAT1270 Current Regulator for Flash LEDs
      commit: 9fe421537c14ed83d17edc8fcbd913833575ad67
[2/3] dt-bindings: leds: skyworks,aat1290: Document FLINH pin
      commit: 8b81978dac2bb1cb260dd921b6b54d280f6c0557
[3/3] leds: aat1290: Add support for AAT1270 Current Regulator for Flash LEDs
      commit: c4adf638e1663885e2b3b3cbdf7116c743150d4f

--
Lee Jones [李琼斯]

