Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795367584;
	b=MSitE+zJ3S0Ow52xBd7Fc1YMhi8GNNFWb+UGA5IDPOjgjaXZzinDzATgrvQOd7K8S7NC
	 rOPpWK1pbWSE6Q/oee5KsrIrwSzf+tVVxtW/XncsrsFC1eP2h0XixFxSWLZ8cddBP5Dyp
	 9r3afWrvqu1F5MLFcsBz0peqBKFZEkmzDlSRU4YTlIOZ0/r8ww8fpXf7mTE0LyVQmwIIE
	 yhCx60mm1K/gQTUdaKB/h9+2JFca4MXDfcdr+lww8LuVHyPIciUl7F4Y/mwrkZ7q8gkvo
	 Y2lG+5tuDzGPyyzKi2osnzg4d6enqCRMuHmFSmhGn1ZuvKS0Ttizoe/sKf7OwDBhndw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795367584;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IZNnqOfb9OPT/SR9WikfuTCg/WDcoaNi0wjVBKpntLE=;
	b=OIOD29+pjPcNFzUhDOEivsXyRmC6Zi8moh/NsWn5YINNs39OoSpwdES3UYehi1Bg45uI
	 vyHfAjWbuLcF1SNZIOsIdN+He+NP7RZkvUVMae3k3BFaEuxhw7yaK6VTeGtiQ5BWKyHN9
	 u74ugBs/3LdOOuoT6UNqy7O+3h6OglU7KgjVQR3jfkZMrBFbcx9EfNO4vsWNjQUZkUQC9
	 YDAbiX94dug9uv82mUM5Tq/4TCeDVrF6E2NQSbsmszU0wHgN7Bp++LtOu0+zIKsIoe/d2
	 YnIjfFM9R2djuIKMPUr28hRuKBpGwcyTY5PDFYgGOyUgYkqGalTUtVLfixHW615J16g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXQyON+L;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5398606A320
	for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BXQyON+L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638851F000C6;
	Sun, 22 Nov 2026 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795367584;
	bh=IZNnqOfb9OPT/SR9WikfuTCg/WDcoaNi0wjVBKpntLE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BXQyON+LUUYtsLo6gHqr1+7YktJcT0aOeWL9MXbO7G3rFLcWgLQIyfxabl1ljY9/d
	 7wuhnv0UYN5U0yWScbznm7uxyvilNJXB5VEw749Db5TdmgzzPIAmjgF24hhYFHFffl
	 nwhBoYRCyQe6LWjbja5aXI6pBgD8h70dApmaxlUEStGirjy/Snuhu6tNZzD2rWkrYe
	 VFX00q4g/km9XeshfhFvlotomI6dj/i9EKWB2LcYEZvqYDAR4oHqdT56P25Nl3o5iA
	 Ui+iZ4lZoMsKeoh41eb5L24EWeX0idNtpWn1cUoSO1BbrYtdUYPvLYBKwAgq7ebFUI
	 RM1Iwz0hzZBpw==
Message-ID: <sashiko-outbox-228125@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 0/2] modernize and fix mc13xxx-led driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Kurz" <akurz@blala.de>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261122170615.31710-1-akurz@blala.de>
References: <20261122170615.31710-1-akurz@blala.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 17:13:04 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

Sashiko has finished reviewing this 2-patch series:

- Patch 1: no issues found.
- Patch 2 ("leds: leds-mc13783: enable driver for deferred probe"): 1
  potential issue (1 Low)

A detailed review has been sent as a separate reply to patch 2.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122170615.3171=
0-1-akurz@blala.de
