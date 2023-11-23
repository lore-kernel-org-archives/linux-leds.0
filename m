Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB767208A1
	for <linux-leds@vger.kernel.org>; Thu, 23 Nov 2023 09:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1oopqca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1DBC433C7;
	Thu, 23 Nov 2023 09:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700730778;
	bh=zgvtUYdjLY8nf9Pvnu1e7wuBnq+SLxZIBLNnSHDbb4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1oopqca9BSADEWi9Y5SCPdbFj6iQ+IWsop1aLr0I3M6Fn9/QoXoYat5apwnJbdHK
	 mY0bvimaK/HKGsW5XqkOUpyOS/Hh6fFzJKT2enH/uCoVGOZ1nit1jsl1UrfLR61ct4
	 zBYrEgJhOyavR/C+8bNGY+c93fM9pxR3DLRwbFBjlJaPR1eNdMszII+QJ8IT6J9BCS
	 8zpacQqMc8Aw56X7/tU/hzJ48KjKzWEKpag0cyrHHVmDjNPqyMEUzvYUlwmO6Vtdkz
	 hUdrpnbcdSw3KSeXs6Pk8dsZBAGl7oAvE/Cr6tjW8H7PGsWZWVtaa5WZzmx406uO4b
	 V38DrcvI84AgQ==
Date: Thu, 23 Nov 2023 09:12:54 +0000
From: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>, Linus Walleij <linus.walleij@linaro.org>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2] leds: syscon: Support 'reg' in addition to
 'offset' for register address
Message-ID: <20231123091254.GA1184245@google.com>
References: <20231122230754.2844665-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231122230754.2844665-2-robh@kernel.org>

On Wed, 22 Nov 2023, Rob Herring wrote:

> The register-bit-led binding now also supports 'reg' in addition to
> 'offset' for the register address. Add support to the driver to get the
> address from 'reg'.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> The binding change landed, but v2[1] was never applied. The last 
> resend[2] may have missed kernel.org addresses.
> 
> [1] https://lore.kernel.org/all/20210913192816.1225025-3-robh@kernel.org/
> [2] https://lore.kernel.org/all/20231025190619.881090-2-robh@kernel.org/
> 
>  drivers/leds/leds-syscon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Looks like I just applied the last one.  I'm assuming no additional
changes, but please let me know if that's not the case.

-- 
Lee Jones [李琼斯]
