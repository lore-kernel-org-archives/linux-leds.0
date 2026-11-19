Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119145;
	b=AkQUEI+/xGGzNAlLGRvTLGvvRJxFjO6hdJihUplfT2Wljzb6SfA3MQx7vkXZa/4Oa4XT
	 Y1z+7med4N2mAc9qYPI4suf7I1BYWpEDwb3/bsXufR6zDS/+hT194xNFJpINwaz9xbS/j
	 wMZFuT1DVAfAgh99X82LKWAFSAzB24gjX6D887BPNtttu87kfdNokzLBpLeBm8/3ZpLgm
	 SJY2XBWynhXlsdD9OD2Cq8Jhu/d614fwLNr7NRIBVho1v2wi7EhXdQ4nvW+H9fTNGbiVS
	 1MZB26xDL9t6UEA3KH3R90jZuZwY+M755ZXjKpqBhdrpTsN7Wm78RdnuUbYWXMKPKfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119145;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=gsNWYPWJvejq7SSvzRjWM6x0/H+p0xaup/q/PIT4JJ4=;
	b=vNPbbt/uDQpFKbpoA7BZQfJcW7pDchByL88C7sDYZJ2Iu/hJugnTBb62BFfi2OIYhgBN
	 nYDSJLX0FHM+4gpGSjekbS/Jai2hdcDE8Mmyjv1CvMWqiThkJMmBjD3NUMqhH7ACXx7U3
	 MIJkHbH87slDhpcKdVTmmQl1fWD0sRVAYetwcu7J57v5ANGrR3UHjQIev2w1O/9yW6V2i
	 Y6CQ7kueQWVoWbQMNYRJK6nUi7VE4BqTgH0F0xaBxD9u/ARfuePcBM71lc2ozhTg2G0jJ
	 +3sPcW40fDbB+JShd34EB2POavkuXBTrMPcLY2xh6qpMSWfRmr9mOYq1sQqoAueB9yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQk3U+1d;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0E860A261F;
	Thu, 19 Nov 2026 20:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQk3U+1d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066B81F000EC;
	Thu, 19 Nov 2026 20:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795119145;
	bh=gsNWYPWJvejq7SSvzRjWM6x0/H+p0xaup/q/PIT4JJ4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fQk3U+1dJxvQ/PQ/obrX49PsNj6Uf5iKPokorZbAHbYYiGmA7fqedKKr1fyZBfJnI
	 xpD8enkZ1DGmUEDdOqh21lYXynG0RmY/CGzbUfHazQ5TxNvmRvo3QIwE0dfIcvfDft
	 ULcrXiBkwCDlP2qrbYoykKwJoLcgV2vJns04SwAH0C5OdlqqWawLyWlvUdlwtRBOgh
	 C+jEwClVnz8wyb7bLvWYrVMf4NcHShuloN18E1fEQVo70jZp+7mQM7pfq06QeFXcq9
	 hQXvCS2FjOVc6L+/aWiHRWjww6vYdaKQQyY3jnr5Gxppjxf3lWwJkVrl2GRvpl+eCl
	 eynUYJ5HngW/Q==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, 
 "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, 
 "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Kees Cook <kees@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261113201936.2645736-1-alexander.sverdlin@siemens.com>
References: <20261113201936.2645736-1-alexander.sverdlin@siemens.com>
Subject: Re: [PATCH v7 0/3] leds: trigger: netdev: fix sysfs_update_group()
 races
Message-Id: <179511914275.11890.9282347584280922354.b4-ty@b4>
Date: Thu, 19 Nov 2026 20:12:22 +0000
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

On Fri, 13 Nov 2026 21:19:29 +0100, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> The netdev LED trigger refreshes the link_speed attribute group with
> sysfs_update_group() from several contexts (the NETDEV_CHANGE notifier,
> device_name writes and, indirectly, trigger (de)activation) that share no
> common lock. On a board that emits PHY link events while the trigger is
> being (re)armed during boot this is observed as a hard sysfs failure:
> 
> [...]

Applied, thanks!

[0/3] leds: trigger: netdev: fix sysfs_update_group() races
      (no commit info)
[1/3] leds: trigger: netdev: Put netdev on activate error path
      commit: 3b92b8f851e2e9414580790a99d9c5871786d2bb
[2/3] leds: trigger: netdev: Fix sysfs_update_group() races
      commit: fca550b96ec607a03de0690b9fbd562743fd6ba2
[3/3] leds: trigger: netdev: Report invalid interval to user space
      commit: c016466c8c8b01af27ac66d97b64fa9c9e431a3d

--
Lee Jones [李琼斯]

