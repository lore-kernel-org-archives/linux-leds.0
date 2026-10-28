Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190544;
	b=o6zZNvzNTPQSEnH27pZZgow6suh2gqqUtZGfLjs6pP3HVLy6CNJEQwv6UZ+OB39UvrfT
	 Cfw3K5VRjft+2VhMI7PB1rYYsnQj9awBCbKEGS+jixCU2wTax8DUo56XmJRoYmFIpv7C7
	 GKMCvHwNK3oFtRxG9QNmW37N5BLg93T5ej02+jMkhINqgdnmDWahwRg9q9MNBN0Vsi5iA
	 RiN3T9mCy5ye6bLvMKdUFEWQuFbahjo9Z6TeBtzuDvnIeyuHTcKk11tQ038vxkp073T9i
	 vD6rbEjvSPkwpzUF+2zq/2ZL2//vkxQFymN00z5UETs3d64d3OsTCrRihsGEJZXyacQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190544;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=5KMtrcUKz85wlxgc8qPMGoLF75cz2MIgF3C+ao5Phew=;
	b=OqpGhJ60Ju/4cG7aXP9bisoHeUwbIkoZZ4PFvPZShmDwsDIKmYOInpQ8HuHDAcyV24uj
	 lsxILNBr+KO1am4nlQllzqmtd1Z60uaFqujs2Ng1hH5adVaGMqkBRo81XkdA38pWaAP3N
	 AB22uvYvQT358vVhKwgP7pX2xK8XdQHstB/92VmV1nNssd4bOMHvkHZ5E6/y3X9/Lwkcy
	 DsyCmpUY81rKXxrR5X6JcTItrrtLr5o8ammAwZ5tCQSbSm/qq0l4r1ihmIcPKvD21JQwN
	 Bj9OYQ3hIvsvnkl4fNTUlIaPcSK3ELf/pnJ7hv5ZPhCjzfyqM8n3/5XRtl188zfWAQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifxBqF4W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7203606A31A;
	Wed, 28 Oct 2026 12:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ifxBqF4W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A4D1F01825;
	Wed, 28 Oct 2026 12:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190543;
	bh=5KMtrcUKz85wlxgc8qPMGoLF75cz2MIgF3C+ao5Phew=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ifxBqF4WteBQvdyb6CHmm655L14E7vB6STmUOX8oqgh9pWgCOtpD7KrR9Bg5Jqznc
	 mmVAHJwu1YKgm5t/+acYxJtPKL9eFoQKRRP0baQ8O9X5Jg+dCfpiBCsrnZYH3G9r2h
	 40EIwKsxyBtzTVa5Hbq59a97opCGAuxzOC+XjxEtYGyjtbUuUiSAT3/5/njEy4QhAx
	 QZVRb/jAvWpjHYNnVl4Dx0whvXlsa8mZcLOlcJMLNGIKhzBhrNNeGfKkjXYgMKx8QX
	 CN5ueLxXmKEo9zrDfShhhCwsM/GxqbnlGT9wi51lrGmDDHpRkE1rz+wDbg0ekbz+b8
	 FQsBrHXW68sew==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261015-acpi-leds-v1-1-81ac99b105e7@thegoodpenguin.co.uk>
References: <20261015-acpi-leds-v1-1-81ac99b105e7@thegoodpenguin.co.uk>
Subject: Re: (subset) [PATCH] leds: nic78bx: Use named initializers for
 acpi_device_id
Message-Id: <179319054230.3660691.12607178300340418619.b4-ty@b4>
Date: Wed, 28 Oct 2026 12:29:02 +0000
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

On Thu, 15 Oct 2026 13:50:18 +0100, Pawel Zalewski wrote:
> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base.

Applied, thanks!

[1/1] leds: nic78bx: Use named initializers for acpi_device_id
      commit: cd2d303d92b9aef102f82a653f77c7fb62bf1c0b

--
Lee Jones [李琼斯]

