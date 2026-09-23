Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCB339DBCC;
	Wed, 23 Sep 2026 15:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790178729; cv=none; b=sYDdnxER6eCFREj3niHYahedC2kM4kYa/D6d0uIVysiHz0tat0WitTSH5pZbJDvhmhp/sLkHkqn7bkQAoSNg0fLBWmZ9FddO4UH7BONWdRDXCJL+4OIhQsd19Uioi8Y8E4ic1PvbMc/0Ae5iZuqbhFdVhgAeoeQiDEcokIfjge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790178729; c=relaxed/simple;
	bh=qRQJdUjfWYOXwGVMmfRR+80yIKrcfJJ9suv3OFbDjTM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=chg5k7/fP1+RxOiixyXVWHJ56ZCeZj3RyoXlRCeWhdbyDZZhYIpI+UcHS+JlueTHTFWaCy9T7G004gYVAgYiA4uVPf8n2n6tTmSZJKX6czhwLFcReQXl+VrvWEiT7Ylivw6R8lJQrzAxVGSu32h36QIKW1iXMoW1MwbIdjGQHko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UgDMmG4g; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UgDMmG4g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DBC1F000FF;
	Wed, 23 Sep 2026 15:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790178727;
	bh=VFOa8V7/rCr9lO5nxCF9tYH3IHR1xvuXP8yV0lpF7K4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=UgDMmG4gfI/WM2AzhgvrCdd+aHNQb1M8KnZdtRUJ8bKpaI2viOsUmj/2B6O1tW8tD
	 M7CexVnOyxcKOy3UUJ7mO5vt2xEFWsxn1C4R3ezykqx5jdhLYfmRoRChH4D6cy0vkR
	 J0g/wuMtaU/N3LENgXZImKDujrTR/ReMxS95hEenXBoW1qNslPGcNtz3s/R56ob/wy
	 3prEVzqjdK+869EqAehYv/CokFJ360Wvqov7EiEwZjeKsjVfnzvbiK5167JH987R/v
	 rhJR4oQVomkae9CQityUd9X4DSeg2YB8NaN324HUpZ8EYZBmN6P1m6ehF3l1H+OXD/
	 zdGhlsxgQKweQ==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260919001331.720072-1-rosenp@gmail.com>
References: <20260919001331.720072-1-rosenp@gmail.com>
Subject: Re: (subset) [PATCHv2] leds: rgb: qcom-lpg: Use fwnode APIs for
 LED parsing
Message-Id: <179017872627.4190609.13954673600879415272.b4-ty@b4>
Date: Wed, 23 Sep 2026 16:52:06 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 18 Sep 2026 17:13:31 -0700, Rosen Penev wrote:
> Convert LED and channel parsing in lpg_add_led() and
> lpg_parse_channel() from DT-specific helpers to the fwnode API.
> The probe loop now uses device_for_each_child_node_scoped(),
> dropping explicit node lifetime handling.
> 
> Behaviour is unchanged for device tree: fwnode_get_child_node_count()
> and both child iteration helpers skip unavailable children on OF,
> and the fwnode handle is passed straight to LED registration.
> 
> [...]

Applied, thanks!

[1/1] leds: rgb: qcom-lpg: Use fwnode APIs for LED parsing
      commit: cfa0b7d98f3f5b731470ea9b6a6d4825aea1687e

--
Lee Jones [李琼斯]

