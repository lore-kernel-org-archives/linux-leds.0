Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179FE225A6
	for <linux-leds@vger.kernel.org>; Thu, 23 Nov 2023 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kdqybyTq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F109C433C7;
	Thu, 23 Nov 2023 10:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700736984;
	bh=gt9z2fXP8rR18XrcKMZMdsGzjLqvt8M1v9NHsKRxsQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kdqybyTqD4Y4FUSQcMl/1rVo3cS1vANF+XUMlp6dCnJfWm4swPou6liKrJLJGuGTF
	 9OVNuoYabjtga9oPk8Cq2F+gKrZfqqspT3A6b57VIdgHbb4d08Vtwziw97SuKCyL+7
	 nKL3bMMzGirj1z287ajtWdQKQACthghTpoCdfZKUhH0iV26oXz71eQhLfnm3uMO3Hf
	 4kUWMXgbyO4F/RnL1BdYGv8uFXdQQpbZ7brh3Uxe8aXLIgX59W50HggzVfta0ED0VQ
	 WRIn3UDWShg4wBMiphUFfizpCK8LMFi9YEjdfyO++z9IW0PYbI6NU55jfGZw7zaZ7d
	 wKcdJYp8r+loA==
Date: Thu, 23 Nov 2023 10:56:20 +0000
From: Lee Jones <lee@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: Expand led_colors[] array
Message-ID: <20231123105620.GG1184245@google.com>
References: <20231030054757.3476-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231030054757.3476-1-jszhang@kernel.org>

On Mon, 30 Oct 2023, Jisheng Zhang wrote:

> commit 472d7b9e8141 ("dt-bindings: leds: Expand LED_COLOR_ID
> definitions") expands LED_COLOR_ID definitions for dt-binding. However,
> it doesn't expand the led_colors[] array in leds core, so if any of
> the newly expaned LED_COLOR_ID definitions is used, the sysfs will
> emit null in the led's name color part. Let's expand the led_colors[]
> array too.
> 
> Before the commit:
> /sys/class/leds # ls
> (null):indicator-0
> 
> After the commit:
> /sys/class/leds # ls
> orange:indicator-0
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/leds/led-core.c | 5 +++++
>  1 file changed, 5 insertions(+)

This already exists as:

  a067943129b4e leds: core: Add more colors from DT bindings to led_colors

-- 
Lee Jones [李琼斯]
