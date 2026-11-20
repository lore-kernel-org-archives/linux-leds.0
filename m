Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155718;
	b=a3zWmQKLJN0SIyNdIGXmu2fNRAm8lQj8jk7e8lT/xFiPg5XYl0WHMX9BLPvNwGcT6qN/
	 O0hIQUt99otw1kpvai2Xf+EogJ/alx5yo/eT2C42Yquo1LR4qah+/m8T4hYbq7/IXXxPP
	 1vdoiuhJGPHs0ccRl332G0HPa346EdvDIyAiH4L82y01+8XHkQqw9IRu07Sw1pubCS6Ud
	 +oJjVtVWGY745u3MdvL9TwnhJSWiMh+XIMrczmPPRnhdw4hQIyr1kmRUcN+DMkSrR2ixp
	 KueUlefUFqdaaqtrs4rjSskdz43DNSc+oUbBO6YfKbwI0qr9iCHbZNvO/89BQdwj8kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155718;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xb8LrPxUsYjjtPxUK8ODuy2JQ43JrwIjKfcbBRsDkCA=;
	b=nkD9J0KghHyZkN2EEkaCCTh8a6GQyV+rYuqFXoMRdtIHNnKp4LrU91CJDuoCtKgIzaXb
	 SXcbmfLePEcj0hX5IeIwTgKqXUUIQkX9nzF+Q7iDfCt6gyGdYmBOR8ojzHjsAPyj2HAHO
	 UGYgonhk8GV0RbQIo204XyGIPbZcintyRHSn2cL37ucmX7YtMJRuJnJAt2XjvaWZNub7l
	 N1JBWGnP5PzRFnJa4y3LbLhAjJmCz8hsFXyZyTKuLHkEyxNnRP75db6go8x3N8PB4yKeD
	 ZA/6467q5GSKVDkXMgdhSatUSlhp8xpSQuNpv0RvkCJkPKRSdPhA5c0ETXg/gfpH9Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+tm6zxm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FCE606A33E
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 06:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+tm6zxm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263E31F000C6;
	Fri, 20 Nov 2026 06:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795155718;
	bh=xb8LrPxUsYjjtPxUK8ODuy2JQ43JrwIjKfcbBRsDkCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i+tm6zxmbfr/Qbo5Y8VfXVKXwD41NSe7axW/D7PpWE5f1k6Hk8aq2mg+Ogq+SUJzL
	 AVAh6CGtsGiTLu1peC5900yZliJaXZJdCyDK8N0rALKONUmqj4kLXl9j6jaXKfwN9A
	 B2ZrP8byNMtk14OK8D5v2eAXUAJF5Bac9RDGMSiAuJHupduuxlakM3H/XPBOn2hyZ3
	 LzHxoH1ctYr6CR6P4PVPBnTZfXZl7SuGUKw0abhp5+R26MqsihTOy1WnxbD6eGXOC7
	 aVUst0oygEZfCmwHlXYsel4uFC86oV0vwTdGlJ/iqfl9vrEROxqY0eWkoQ/aMqH0j8
	 alFbZzK+iuzCA==
Message-ID: <sashiko-outbox-224556@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] tools/leds: Build the full hardware brightness path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261120061840.98122-1-zhujun2@cmss.chinamobile.com>
References: <20261120061840.98122-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 06:21:57 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> The path includes both the LED class directory and the attribute
> name, but snprintf() limits the entire result to the LED name size.
> This truncates valid paths and causes open() to fail. Allow room
> for the whole path and check for truncation before opening it.
>=20
> Fixes: ae3473231e77 ("tools/leds: Add led_hw_brightness_mon program")
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120061840.9812=
2-1-zhujun2@cmss.chinamobile.com?part=3D1

