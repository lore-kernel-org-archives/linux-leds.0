Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB913A1E91
	for <linux-leds@vger.kernel.org>; Thu,  5 Feb 2026 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770306713; cv=none; b=nJjW/nZAx4OR2ovQhh6jKIjR/FJSkciChSjlNEtFHlOXYqEGyozuR2+JxSxygUJgTFtIHbgOeAnocryNzn9Rlo57zD87THrhRGqWBsiX3HpLzxawfv5OlfFT4GyOZAZ5KogB3Bh8MznAKt7h3IM8DEC9gh3c+myxno+etB2P2Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770306713; c=relaxed/simple;
	bh=q9JPZzNrbWb0wSPW6dbkP8HxqNqG1TxRXw3FSvd/ncg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jJjVQfFppYFefrB63ivqqayEWVwNJSSNtxdjwLnVCOINYvJr2W4kzdmZAfRxnH2WBcO2xNmaTzVjfHD0eXo0R8wFOYRXxvOONt9fbu4FMf+NqajrOsRUhJkNPRmC1j3BrvlPvQR6ssb6wBD8FF084gjRjNo31dfGkAxdDgE+dP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgzHGnTY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgzHGnTY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC12C4CEF7;
	Thu,  5 Feb 2026 15:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770306713;
	bh=q9JPZzNrbWb0wSPW6dbkP8HxqNqG1TxRXw3FSvd/ncg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EgzHGnTY3JUN7n3XElh73LL6H73WKEfvAu0971jI/VHnnPVrmENQIiB+nBoMp5e/u
	 v1kOcVqzv05MqI2eYpUPu5dXjvwKvXuTZALu+WcIFXyE+5djAtsP+EInmTIHCVnZ6/
	 fXnLeASxn127tnTL0bK1TafXaY0Bl/D4N3WY/NQGoorwgFNNH4MYhDxbywbuJcOdGD
	 7OGX2PohwNhZ4ZtBkUeSU/339TFSstOeBoPgJCCb1bBHKaG8xWOXxdEmpqy86R/qHx
	 XiOYcow/xghbbCHiYrPYFxeKcTytL2CtEzqyNIQMmBfQZI3k5aBJShJTyzipP7Ec2g
	 N3++0gECMimVA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Dan Murphy <dmurphy@ti.com>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Michael Tretter <m.tretter@pengutronix.de>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 kernel@pengutronix.de, Khalid Talash <ktalash@topcon.com>
In-Reply-To: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
References: <20260123-leds-multicolor-limit-intensity-v1-1-b37761c2fdfd@pengutronix.de>
Subject: Re: (subset) [PATCH] leds: multicolor: limit intensity to
 max_brightness of LED
Message-Id: <177030671081.1676312.14030909402234954493.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 15:51:50 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Fri, 23 Jan 2026 11:13:24 +0100, Michael Tretter wrote:
> According to Documentation/ABI/testing/sysfs-class-led-multicolor, the
> intensity should not exceed /sys/class/leds/<led>/max_brightness.
> 
> The interface doesn't check the values and higher values may lead to
> unexpected color changes if the brightness is changed.
> 
> Clamp the intensity value to max_brightness.
> 
> [...]

Applied, thanks!

[1/1] leds: multicolor: limit intensity to max_brightness of LED
      commit: 129f82752bcecd554936209aac4dbdd888e92224

--
Lee Jones [李琼斯]

