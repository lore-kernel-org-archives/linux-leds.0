Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0633A5459;
	Thu,  6 Aug 2026 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024324; cv=none; b=PPVw9sbNcG5KNsQ74CAlvt9SI4cHocNahvV+fSkb6DiP79NCLqa+vTQqsWQcBMloN03F1ZTw8wdmQGZk2jxJ6vIgMkpZyzdHCWFQd19NG3sQwoXqNBO4MipBl2vT8o5ZGLGSRZGOKF48rQRmEzH6zJkx7CUU4lIkxHhr3zyIqQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024324; c=relaxed/simple;
	bh=DMvvYa1DhtF4peVHu0CVkiQq6jWqHLTPGyxm+8tf9+U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WTdoJDKI+4sPz9PlAc/fl/x1i/A/M/Xj+kFrctX+wdirj/wymtK62eQ+cz+KxQm+zMkxgtumZ6yD4vHCWIdWtHwYrKPf6HKkr56k6qF2GpwPyLSMHeemipuinpn75N5XBazfGecP9ddX5b83w/8N82FnUp9OcRxmwgP1DCU4tGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBadhu19; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBadhu19"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807ED1F000E9;
	Thu,  6 Aug 2026 13:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786024322;
	bh=skwyoP7sDK4AxIpF10N/qFGsjSVRSDJNLRDkPo0x9lw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dBadhu19tIVuwPR3deZ6GoJnG7B2ld1LedTRF1XByZ74i+8d60OMW9alZH3cljD80
	 xhlDFhl/++dPUzeMdO+YmEbvEqDIgD9CcSSblK5HBqslpmxUIz5GWO/qOhxkL1JPw7
	 e8iZUHCB5tem+LmbDa79A0+ogD2kUwY7mV00/Gl/7ZlbNdMIdN+0Yjhuq8F/bwfYGl
	 wVqOh0qoPCHL4sRSy9wdPmz5SomFNQF/d+NgfVZf3aYttYj1U7WJ+RIa+jYJTaNc1Z
	 /ZdOkyAJtUCCEcKoVCJHUGAdiPIHSZ6FAVsY35y6HNMt6tA4xaGBKPOIRb00tLUSwC
	 n2iEwbOfM21RA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Steve Dunnagan <sdunnaga@redhat.com>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Linus Walleij <linusw@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260724180412.43150-1-sdunnaga@redhat.com>
References: <20260724180412.43150-1-sdunnaga@redhat.com>
Subject: Re: (subset) [PATCH v2] leds: gpio: Clear error pointers for
 skipped LEDs
Message-Id: <178602432127.2934315.922699465700010447.b4-ty@b4>
Date: Thu, 06 Aug 2026 14:52:01 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 24 Jul 2026 14:04:12 -0400, Steve Dunnagan wrote:
> gpio_led_get_gpiod() returns an error pointer when a platform-data
> LED's GPIO is unavailable. gpio_led_probe() skips registration in that
> case, but leaves the error pointer in led_dat->gpiod.
> 
> The skipped entry remains included in priv->num_leds. During shutdown,
> gpio_led_shutdown() walks those entries and passes the error pointer to
> gpio_led_set(), producing:
> 
> [...]

Applied, thanks!

[1/1] leds: gpio: Clear error pointers for skipped LEDs
      commit: 942901eeda934f1bebf2605a781155e9d6bc7f6e

--
Lee Jones [李琼斯]

