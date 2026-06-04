Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4B047F2F0;
	Thu,  4 Jun 2026 16:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590873; cv=none; b=MdqlBdPfHQlaDbHFj0oj0+mtNPd49GYbV0rUSHMg4HhVameGhf5OQNy9PM+O7H1Wr9l/G57dtCPbhI+TT+DdvqLhxH3DkKDPk3T3UDhQVk3DjCoeBgjwGvdJnXzNJAs+X4tx9srOhNWALnqSQfKl4c2IMlwaozCLmllp9bIq+JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590873; c=relaxed/simple;
	bh=hcqeidJ5DbC4DBI8iadUb+nu+0nnB7g5XsCgJJgRef8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ec4bitr4yZVPUXDyYh8b9YKVUwGb9VPB1tBBOxxBE6JGXfXeeUdAt7Tt+Rz+cGma57Pp4G1jZ/uRaSP2hyDcHfR1CX5JoMnJnK2fCITs0CaABzgzfQmkmfKpiMBu+GHxr/HoFpWAfRPP1RUCXb+5mrJVoptvY7xNcvaRH8oNPcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwjQBo5T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwjQBo5T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668751F00893;
	Thu,  4 Jun 2026 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780590872;
	bh=8lUX2LXHW7/8aXH/gaUcqbzEzjUbnWs6QP6IbJiKmfc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NwjQBo5T3Y4uz0LJkadF0+KbR1MbZ5BJU5H69ODIpRz9yKSGP2QGIlMa0KcVIMRrP
	 rAp5DM52TDO2ypcDb3VpZNXZnOeFUc/4/abtVd0n4BVxCbEUFHp0GNVQwWifdM57z1
	 ikWOAq8IcOVEgGbTbbOGG4coigB2D9ZS7mSUwUTSn1lBewmpkZNHyjNOmKlEoJq26i
	 dC0dkMY2xZC72oF5YSu5OYgWaBAP/dRi7BfvIfYYNi4+bJLIeo0qRsKXIF91dtXVU+
	 jXAzeH+qmKHWR699Ric7GKsFn7YA7qJ1NY15X/37KPuM1KdEvQyRQVHdkC/zSGxkuY
	 auaHAB1qWM+KQ==
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260526103738.3389272-1-arnd@kernel.org>
References: <20260526103738.3389272-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH] leds: fix CONFIG_OF dependency for
 LEDS_LP5860_CORE
Message-Id: <178059087016.108535.11067272954639479244.b4-ty@b4>
Date: Thu, 04 Jun 2026 17:34:30 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 26 May 2026 12:37:32 +0200, Arnd Bergmann wrote:
> Building LEDS_LP5860_SPI wihtout CONFIG_OF leads to a build time warning:
> 
> WARNING: unmet direct dependencies detected for LEDS_LP5860_CORE
>   Depends on [n]: NEW_LEDS [=y] && LEDS_CLASS_MULTICOLOR [=y] && LEDS_CLASS [=y] && OF [=n]
>   Selected by [y]:
>   - LEDS_LP5860_SPI [=y] && NEW_LEDS [=y] && LEDS_CLASS_MULTICOLOR [=y] && SPI [=y]
> 
> [...]

Applied, thanks!

[1/1] leds: fix CONFIG_OF dependency for LEDS_LP5860_CORE
      commit: a2263676302a4eec40af93b3829f1d3d5aade93c

--
Lee Jones [李琼斯]

