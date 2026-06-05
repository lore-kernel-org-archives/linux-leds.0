Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F9547F2FC;
	Fri,  5 Jun 2026 07:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645529; cv=none; b=Zx0RorIVZLYzMHfHFKwyXlQ/mtINTs8BzWs6pZuZv/AVlVDsh5ozE1qVWaivRZlD3A7KLGpTq9aZFeYBBFJCEKyM8HSxYECi90KgI11UtozB7F73PGFzYg/zhskRYxt4v5WtajAucRDPi/xz+6uBC8UAPJGzuP24GHBbPDWUbWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645529; c=relaxed/simple;
	bh=429CBdm2kK6AmmLW4WHTjGVkDXomgP9jz+1HYnL19OI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MykmAs0PZ8aSKvOO3Qakb1ji2U39q6sc56TteoVIdPJjsaUuUqL7NMuL/UfOmTWAOuoYVNuePzCQ5P9c/JYzVKGjGBiRz/ZFJ2g9iwbGu1kdjhgoB4f++jN6f3oS4dyXMJec0TuPCDQQgJf1GghzcMB3q2aEbQqszFlivkTY65Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZSXhMf9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZSXhMf9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DD31F00893;
	Fri,  5 Jun 2026 07:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780645527;
	bh=4z0XKWwvj1/uLpf3ETLlK913vPnUA0EB0ybPj6eJQnc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kZSXhMf9WElWVcr++bPUrdEDRuj9CsQtjE4m1L7gbF4gxjH8M8UMa/nDE2c+WNOSN
	 j+5FepS1bsjFxxW6B5gUaZL2XLRouxx1u6OoMAqyVqns9k6WGe705oLNoKJR02h8wa
	 9BQ5eGZp2obdEceyY4oD+0nGPWi9/ePwrBeABndkTewpyhvHc1NVjCjOmcLza/dyOL
	 XQ2RfY+Hu2n+X/WOwnizZYYNuyW5cirSnK5YZ72uNxH4cHEh3zJYAiSxDRFDjN8yfO
	 98nQ+uupbrN/lPdNWM9p0fklt1d82WO4KHfyNU2yqxOfgkpXC6R0UCoNYMuNbXslRc
	 M+24+Er7izKhA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, pavel@kernel.org, Armin Wolf <W_Armin@gmx.de>
Cc: corbet@lwn.net, linux-leds@vger.kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <20260527001422.51111-1-W_Armin@gmx.de>
References: <20260527001422.51111-1-W_Armin@gmx.de>
Subject: Re: (subset) [PATCH] leds: Fix sysfs ABI date
Message-Id: <178064552642.523529.10416312564557000722.b4-ty@b4>
Date: Fri, 05 Jun 2026 08:45:26 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 27 May 2026 02:14:22 +0200, Armin Wolf wrote:
> The "multi_max_intensity" sysfs attribute was not included
> in kernel 7.1, so update the KernelVersion and Date tags
> accordingly.

Applied, thanks!

[1/1] leds: Fix sysfs ABI date
      commit: fa252b55ea6126729b7e0c1de975268056673464

--
Lee Jones [李琼斯]

