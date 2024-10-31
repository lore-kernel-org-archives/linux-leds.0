Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F601A3BDA;
	Thu, 31 Oct 2024 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386892; cv=none; b=dQ5PDFjAgOWdXqz53eTthLy6+VVn8A7ZVzToCTSgHhrT8XUQ4BB36UXJda0i/lYnBm4aYaQhdfkBCknzifQQQ2p5C5P19sjTzfE++4TdqLGqEtSVa+KZMCWkuGT0gbf9HP/IAjhFhI2VUGNYrvlAt62/3rpMseWW4J0mYnvSFqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386892; c=relaxed/simple;
	bh=evGkl4OpbxppikKpNtC9am/G1AS6QcQxgBBCserdnjA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tpwcTxhuwLcKPSjnrV1mSDbGG4dBpmfWcRmlLrOLjpyVVPQV+jzti2UnD3qcLnS77pkFp4jGJMbUBfTgEBLkKpAbUV6jgRKoH5Pv/4cDQO5T4Io93gS4Jbt0ShowGIgxsRS0kYrBDQQkm9aRvJ+pTTcICY/5apKM8WWPGOKlj2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWX9pe8q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWX9pe8q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5E6C56860;
	Thu, 31 Oct 2024 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730386891;
	bh=evGkl4OpbxppikKpNtC9am/G1AS6QcQxgBBCserdnjA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mWX9pe8qEReqw5vdbppACcxeBCnRjy8GbyDGiOQAgKMjeWKwKzesCHXkpeOa/vSPj
	 gjq0yXkPIeV6Ts0+QYsrS1WrMyjjJ/2OTh9QEsX9V3Ms7UiAqSNQqtcJbc6++kIqat
	 i8jMEb/8KtHry1jg9CSV+sIW6tMFEnd91uJbJkgj273obN6VGaB+iXj6Dn134GhFpS
	 rQuj8AWRruYTf/Le9cjX1+p7A+/cT8xGyp7c/A7Zlmi5RSelVJp0uhXtnfqpANfR7o
	 tOnYU/uSie8F4JW5jRZ0v2V4v+qgzw5pYoC3+EK4LIBrp2ZjrZHI3jTS7Zm5Qnryjn
	 SfFzoFUwlC/6w==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Michal_Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20241017150812.3563629-1-michal.vokac@ysoft.com>
References: <20241017150812.3563629-1-michal.vokac@ysoft.com>
Subject: Re: (subset) [PATCH v2] leds: lp55xx: Remove redundant test for
 invalid channel number
Message-Id: <173038688951.1765401.5004620749954474851.b4-ty@kernel.org>
Date: Thu, 31 Oct 2024 15:01:29 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Thu, 17 Oct 2024 17:08:12 +0200, Michal Vokáč wrote:
> Since commit 92a81562e695 ("leds: lp55xx: Add multicolor framework
> support to lp55xx") there are two subsequent tests if the chan_nr
> (reg property) is in valid range. One in the lp55xx_init_led()
> function and one in the lp55xx_parse_common_child() function that
> was added with the mentioned commit.
> 
> There are two issues with that.
> 
> [...]

Applied, thanks!

[1/1] leds: lp55xx: Remove redundant test for invalid channel number
      commit: 09b1ef9813a0742674f7efe26104403ca94a1b4a

--
Lee Jones [李琼斯]

