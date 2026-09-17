Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681B9568FD0;
	Thu, 17 Sep 2026 14:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653851; cv=none; b=D15Bq1ImFZfGZt26YNv9W2eK911PXoNwjXze7gS7f/0rcNVXZPxeL+OVSsXx2V4bqyVnbb6K/xAWZDgzNdbul6Id+OJTpd5jhD4eK89M0QTQkTsFU0nmTi4J8JJZQuLeCBOb+fzBfnArm6TjMN1RAcD1akNQhwUaF5ZZoC/a0n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653851; c=relaxed/simple;
	bh=uo9hoXN5vdiNuJecqPO7pb7LHH4gJZowd94cAmnbMjs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=UGcU98o/q6zFM8oWD2e0uOImSi9szh5+ZQl8qrpowKJCMLnEQA+CZdpzCyLeA6uukk7501owRNcTAn2Ve3SuhhHtHV0u7DbzEPXgwDMggEGhoLWjRpho7N5RarWMUmD8GpTCLI0zqmjqqBNd5pzwHKPlTfwFADcPbo1KtK2cfBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lcyNOQDY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lcyNOQDY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D5D1F00893;
	Thu, 17 Sep 2026 14:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789653850;
	bh=1Zlik05fm3kAkuBjWwlCci/M9LhK5o0tvuMLwjrbpS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lcyNOQDYrDzpjUQTMKApy3HyLMchV7K8M+J8bk7f0bCgO4hsmGPEQxP21BTwQvBZl
	 c9cS1YJ5HBh4pwziSkYUB9ywbCryZBjRmmoGIVJp3vCNIofy2aMBNKOg76r6Pm6GlZ
	 PGyrKMZLkxOcgLxr4wyxPJ3E3xUT1Rbj5AX22yq3kpEAhBjMRu2e3AR844deSUZeVz
	 qd/xH77mDW74cVS01bMmZtqLEeIq5GT5q8A1lMkOw07AAfE3oUviLbwSUeNtH7qirB
	 tUQ3M/BaNAJ5/gTQz3KGNMNuMbWKlZ4oi+epcIolbpedpeAdkuQvv6eTWsRboNRP1T
	 49BkInxoAzpsA==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260907202436.42304-1-rosenp@gmail.com>
References: <20260907202436.42304-1-rosenp@gmail.com>
Subject: Re: (subset) [PATCH] leds: syscon: Use device property API
Message-Id: <178965384874.2332209.14265144003996215080.b4-ty@b4>
Date: Thu, 17 Sep 2026 15:04:08 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 07 Sep 2026 13:24:36 -0700, Rosen Penev wrote:
> Replace the DT-specific of_property_read_u32() calls and the
> dev_of_node()/of_fwnode_handle() roundtrip with their
> device/fwnode equivalents. Behaviour is unchanged for device
> tree: device_property_read_u32() and dev_fwnode() operate on the
> same node, and the fallback from "reg" to "offset" is preserved.
> 
> Use dev_fwnode() for init_data.fwnode; unlike a child node from
> a scoped iterator, the platform device's own node is held by the
> driver core for the device lifetime.
> 
> [...]

Applied, thanks!

[1/1] leds: syscon: Use device property API
      commit: ceb3263b276ea6d9859e31ab6e556a9dc1649843

--
Lee Jones [李琼斯]

