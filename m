Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428630;
	b=Lh7Vh/QJBc+amXeGp6ZTdEgLVmbAGnpXUUVDTIIRLF97yOe7jac2mlyMqj2syTu9hdMs
	 k74wmAm5XcSoH+esHexSvcAU+QX0dpd5JXDtHc0FgtRthQvb8cd+81wIEdqG1opZst6d4
	 e4bAMgIFNKBduDeobeLLq9elHvgzWNEGZQQzX3z9TGB6Lw74t/WxhYKX2DKlcaKsP3bYn
	 7Mw8FjeyII1ZDfCrUTUijn9noGOv1SHtw3z22/QPp0n/yJspLEcqvCnylXQJqEfacnC20
	 Ps0IQG1FqIV0Sbs2AkSt/pHC8KWOxqI4gSNC6fEMPyM6Qp31XMZ+GHl5K8t5GYZFQKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428630;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=IHq8mIaLXBktNft6oos0AtIFO7RdwEDQb3JIC/EL9ks=;
	b=jj7Yl8e/a5C99c3UxH+R0PUrUHneUXanjxWsCps4dG+jlvIWaQ63K8dKN9rc/Pl7kAtZ
	 0LiaV11qAzgi8DXRDYi42LfmExWJnbB69PdJiZjC+Okr7rNeZzyD9u5q7QgWCvckwxou8
	 X2XQnINu6lCNfpQTnDkbJuucqECYNEEtFlxbT4BSPDXCIZ1QwrBkZN0QazPGyRLJpqrJR
	 RtxTH2+vbVWM6YVJ1LPs5td7S+vOEsAzvFtKIkz1FSMI3q3Q5HT3iEC8G3c6JOEXWHHAB
	 +2wGEIGlQVyfvnm0Zn+dO/IJUs82fc0IaRHE/+B73RFcXozMHBfcAm/+vEU6nu8NGCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dHxLMk3Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9AD606A324;
	Mon, 19 Oct 2026 16:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dHxLMk3Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F52C1F000C4;
	Mon, 19 Oct 2026 16:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792428629;
	bh=IHq8mIaLXBktNft6oos0AtIFO7RdwEDQb3JIC/EL9ks=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dHxLMk3Z1QsATrx5vmElhHPm1qP6M0MUQn0jX6VOisiYUGl+E6CxwSBWuV8O4TIQO
	 PcnHxO29XIPbJo3lD6fStE6a3Ey/9h0RXihZ9xfs6ScqQSQQG5qqMzPoMbtyL3v38D
	 fBLAXheXY0A73LMoNNtOLLu6DD4e4obE31pRStCe1uINyGJzvdcLR+T5P1UM3KSOMu
	 gBA+0TcgTCpADPPPxoMK4GzQ4roNWRTl1l7fAO3J/iDyvuj4zNM67R6otXRNkX1WX7
	 L/YT8qR6fpNPQaCvpyRBk1oOxzSwhAJzJHJU3SwxYLwmDNSWV6eQKq7pKAoxRJvrSX
	 wL6Fv/AbjhVJg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Wayne Ho <wayneho219@gmail.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
In-Reply-To: <20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com>
References: <20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com>
Subject: Re: [PATCH v2 0/2] Documentation: ABI: leds: Document shared
 trigger attributes
Message-Id: <179242862790.1205449.11213629820921338679.b4-ty@b4>
Date: Mon, 19 Oct 2026 17:50:27 +0100
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

On Mon, 05 Oct 2026 23:27:45 +0800, Wayne Ho wrote:
> The delay_on, delay_off and invert attributes are created by several
> LED triggers, but only the oneshot variants are documented. Adding a
> separate ABI file per trigger would make get_abi.py report the same
> sysfs path as defined more than once, so patch 2 moves these entries
> to sysfs-class-led and describes each trigger's behaviour there.
> 
> Patch 1 is a small preparatory fix: the existing inverted entry still
> mentions the gpio trigger, which no longer creates that attribute.
> 
> [...]

Applied, thanks!

[1/2] Documentation: ABI: leds: Drop stale gpio trigger reference for inverted
      commit: c8bc1535cdb1db6d5558f66ce901158b06599f8d
[2/2] Documentation: ABI: leds: Document timer, heartbeat and activity attributes
      commit: 7ceca5cd576edfa6d078079ef09ddce21223be38

--
Lee Jones [李琼斯]

