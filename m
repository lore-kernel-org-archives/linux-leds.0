Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D985916F278;
	Thu,  2 May 2024 17:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714669601; cv=none; b=dskYX72nirKV4Hfd8aq1JkDOVRldvhe9oXZTaIZNNxayrEExQzqyaNxrLeRdGo5xSWF2hFVeEnGM2yHthzivt0J8HOdUoDtFFZhp1av+8FYag6Tj2XLIVmphltWf0K8phZl4ZIPRHWauTp1ZQtqMN+Ie2TDb/+28z7w6C9cPPwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714669601; c=relaxed/simple;
	bh=mE4BhmHAO8yuu5uppOjZG2uFJX80WjKUKiIe9bnCy9I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Iktoi7jI2RJVTt0I5U/gzLONuFhMUZIZsfQcLTdq7PmKhkOtwYyExyWvcoIMWLVzO+c4mguKaqcWmzkE8nZp2FMp5lMTPMP9llzUXvZQbAaRWauEyVN8Fw9IwAVk6U7kLIAmHAfx7xCSgVmkxyzJswEVDy3P27Ga/YyVgLb/VGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kaXpITXu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kaXpITXu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595B8C113CC;
	Thu,  2 May 2024 17:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714669600;
	bh=mE4BhmHAO8yuu5uppOjZG2uFJX80WjKUKiIe9bnCy9I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kaXpITXuotBffWHCOpJMvMuqQSN7yg80getj8BfSUFKo1v9CzHGunWBguPcZPEeTP
	 3LTiL8ANruypLtxOqhSotIlQxkMFjOttJ+DxihyEKzGjylSmPtXNECUGHD5hYXaY+Z
	 vDxVpazITT2hHLeJqkVeeO+duKaKt8qw9EhRE55vVe6stFPU9fn7K2q3nK1KwIfINl
	 mVpIhw8Zd74V+RoUJNxVtXc4z5eAagpAYzqc3r0tEsY21hw1tJ3YMnn0KB6Imz61Zg
	 cSzH8h7Ye6AAyJxpAGnQyqWEzKPpGuvraiWE1dkOB5DUUoxONyGnU62sZ4nAQYWfRd
	 AIURHxFNWSgXA==
From: Lee Jones <lee@kernel.org>
To: Samuel Holland <samuel@sholland.org>, linux-leds@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
In-Reply-To: <20240426152515.872917-1-andriy.shevchenko@linux.intel.com>
References: <20240426152515.872917-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] leds: sun50i-a100: Use match_string()
 helper to simplify the code
Message-Id: <171466959809.1216285.1962386454331475861.b4-ty@kernel.org>
Date: Thu, 02 May 2024 18:06:38 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Fri, 26 Apr 2024 18:25:15 +0300, Andy Shevchenko wrote:
> match_string() returns the array index of a matching string.
> Use it instead of the open-coded implementation.
> 
> 

Applied, thanks!

[1/1] leds: sun50i-a100: Use match_string() helper to simplify the code
      commit: 3b29c7b9f701e5afbe6b536eb2744acb25cf5bfd

--
Lee Jones [李琼斯]

