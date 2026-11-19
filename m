Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119142;
	b=dLJRc+eL/iFKrWBlck0SmVts8n/Xx4UHT1HpWp2xMoMrnPKjmfkvy0Q65eIAANjvc+XP
	 rhzbRopJdM/RXK2bcgpxOYqsg4ErI2BE+6kNiMenWpK0NSUzG5KoouVku9GbCx4dEbblI
	 h0REDkuF0TVt0TWONvP9moz9mLxLdMZM2WSX1ZQxOVgd2HHd0rX/FKeXEPzSniCAhEwKa
	 vQ6yZK7ozvcPpdzjJYeCyLRBphE4/flZnN/b8klgNr1gp7tEpW3DMmhbCxFjbYAV7NFrq
	 6Ok7V51W175m/U0NjXqsFUAHBuPx5Iv3NWwyWJ61ImG9qbt+fmS8UPBI+ScrokKvFFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119142;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=uHbtmVn3WCiJsKx99HiPQBxwCJQW2CEBzVShvMVnXSs=;
	b=CeRh0gLR/dClUb4/gHspqSI9+U7hY0YxKkICjdumvIPiB5ulCwDje4LaTXiqPIxZ50f+
	 j83x7kkmDIMAnYEePXNoP6iM1HOU+zt/8+b8kFNkqmd4mQpjVHWC0r4AaG43Y6tDRvvp6
	 t4NrSpx/rsSEO++w1yrNrKdrD/LtrUWaXo86004OuzuIuKxZD7bXKTfAUnPXBuofSBmMh
	 e7wGttLnL2kl8fGIx/+2OjM9YYBoLkmms4cM+KNzb82CATWNQUZgfB5ZZoljo1nWPzN90
	 mEkv1pg4xHW5Wn5X6X+qdK+RmkjxR6POpw4XBjr6QJDmCsP39FTdz2oyBTatWawmdlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M7+Bbcna;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914D6606A33D;
	Thu, 19 Nov 2026 20:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M7+Bbcna
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 641961F000C6;
	Thu, 19 Nov 2026 20:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795119142;
	bh=uHbtmVn3WCiJsKx99HiPQBxwCJQW2CEBzVShvMVnXSs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=M7+Bbcnacjnt/BQ6vPQ9RE8tg49RANL4gkNJAmOp1SlOoXea4IGSeDhQP6+5Csog8
	 lme1brZA+wZwJX4w1AfZQyqh19JxvdR1Nmp9+GAsV178ZTwW3sTxc7uun3aCCn4JmJ
	 wQIIY9qn+BIOjgjmfhuyYM25z0jqmHW6qwPGv0oG1vXJMNuEx91aPAyE9dJEZhMNCI
	 1sidXUe3lNR+oypO0Ftsi4p9SVgbNasYppFElpLC7tktU/CNdU0N34xn5Yo4xB2v0W
	 W6pkuXKNV4sS7RJbc2eDduhvFBirGkdjOp/LFghEORSUIYfhRUx0VJUCVtUKBBt2EN
	 oAWBTKyJMq3Cw==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, 
 "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, 
 "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Kees Cook <kees@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
References: <20261027113349.383147-1-alexander.sverdlin@siemens.com>
Subject: Re: [PATCH v6 0/5] leds: trigger: netdev: fix sysfs_update_group()
 races
Message-Id: <179511914014.11890.3233057035317468566.b4-ty@b4>
Date: Thu, 19 Nov 2026 20:12:20 +0000
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

On Tue, 27 Oct 2026 12:33:40 +0100, A. Sverdlin wrote:
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

[0/5] leds: trigger: netdev: fix sysfs_update_group() races
      (no commit info)
[1/5] leds: trigger: netdev: Put netdev on activate error path
      commit: 3b92b8f851e2e9414580790a99d9c5871786d2bb
[2/5] leds: trigger: netdev: Access net_dev under trigger_data->lock in the worker
      (no commit info)
[3/5] leds: trigger: netdev: Fix sysfs_update_group() races
      commit: fca550b96ec607a03de0690b9fbd562743fd6ba2
[4/5] leds: trigger: netdev: Report invalid interval to user space
      commit: c016466c8c8b01af27ac66d97b64fa9c9e431a3d
[5/5] leds: trigger: netdev: Serialize mode/interval stores with trigger lock
      (no commit info)

--
Lee Jones [李琼斯]

