Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B6F175A81;
	Thu,  9 Apr 2026 12:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775738987; cv=none; b=fLSL6vKk22LiauaRSEf7MwHG6g2klrslTFtHAY6vBjRZriFEefiqwS9yNlYVQjikRQqztj9Cr2XQIuUnFi2hucYL4GS2Vl9h2C9/rPmwhdUhBx7POzYeDxsO6ATmZEWFwLc6uDaYb8RFK7DZhB/lknr7F/EVq8dS8tyuUrOHJ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775738987; c=relaxed/simple;
	bh=feW4+NERZIeANKnOhDjiBOp62xL2drfEq79UueEiNGQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DUp/lAWSzOfWtYNWX3Rk4PJCKwNZFYjP7279xUAEUHsYIk30LLa0LCeutJw5Df8AHWnpYIR/+tij+BtUFn6Xfua2fJEjYuzsuqCfDnJo2wxko+oJS5I3nzJn7JWouRpfVMdXsMWFEx/hyiWpvzPG+nxPIFW9beLsBUbMXxmXcfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k935kUTL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k935kUTL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F183C4CEF7;
	Thu,  9 Apr 2026 12:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775738987;
	bh=feW4+NERZIeANKnOhDjiBOp62xL2drfEq79UueEiNGQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=k935kUTLthNFffYd41cUvwLGCtIfNL+U+7aZ14pRxVYD8YXiMDdV6nQxJyxX8u7vw
	 77Yu9mJ/dYjJF2mx+32gFYCkJAUKahz6aSLqSAN/mdMGFzHj3bR2GlejXcQBdhndrc
	 ueaXfqKaUl/+98spgO0RKcXvDV48Jgi2n0NMKEQlg4qqbZAm82TSLhxUkKV6gtRvtV
	 up5CGG0QSSTdf3IbVXa+aOzORC9+lSGbGCvoD310sqtMPOKk3tMFzsNpxzy+Ekowvs
	 tNDaFVYJXVFp//7eD5QMbpSG/RKoJc9ByaxD/lnAvHrRzPnL5ONiem7POOfx3iDTwW
	 o83wo6B2vzFDA==
From: Lee Jones <lee@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
In-Reply-To: <20260327102729.797254-1-andriy.shevchenko@linux.intel.com>
References: <20260327102729.797254-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] leds: class: Make led_remove_lookup()
 NULL-aware
Message-Id: <177573898580.3322444.3067002798107722779.b4-ty@b4>
Date: Thu, 09 Apr 2026 13:49:45 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 27 Mar 2026 11:27:29 +0100, Andy Shevchenko wrote:
> It is a usual pattern in the kernel to make releasing functions be NULL-aware
> so they become a no-op. This helps reducing unneeded checks in the code where
> the given resource is optional.

Applied, thanks!

[1/1] leds: class: Make led_remove_lookup() NULL-aware
      commit: 7a43ccf85dfe06eef483c034e68b81ff326741aa

--
Lee Jones [李琼斯]

