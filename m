Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC043E5A19;
	Thu, 18 Jun 2026 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780511; cv=none; b=M/YRqKto9yMh+7RiZbRJolVR/gkLouYSE5iwv6PDRVFo1f5hrV6XO05GVSyiN8J5ub+cuL+qQ/oKafC2p5gkJE9MNKffa/hyymhQ+1Seo6peKrHA9dWMZzv2zLeIx4D6YNtfxv1DyHBUOLQA9MUhXXnrunxczgGFxZbl7KgZhPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780511; c=relaxed/simple;
	bh=QL/P5Fre2/e520jnXbKQXswLIl/sUoqk9tM5Ywx7+YM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rGKAm9YM05JfkjqEC+JZZsSyyvyV0WFFP+lRgILFqGkp/x4jejWG/gis5o/XdgV4N8erW6sbWD4Dgn72QnGdOgV9RFZn00YOcGg5CcSPLzyEQUo/0ONbXTYpb9mlboO/6PodH7wrw8vf84Od4Avy6lpurNUdCQ4RerzCZoup8wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKBB+g6Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKBB+g6Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43191F000E9;
	Thu, 18 Jun 2026 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781780510;
	bh=6lOViM8XZw8IyXWySCnmvDdUeVR9stpYQ3Laie40P4k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=BKBB+g6QeeXwV4RmUoy7LRLlpVYEI3/ZkwZdB5cmwLC3NmyiyxCCvVwzgJsoUzWZ2
	 Bnl/3zWJb3vjNLPJxP4Uw70q63wN3YxJV3TRRSPXcKDq/Q8N6MjGoXVF0dez7iLfdr
	 W2xpw/7DOT0HdrnaqyelYT+guKFt2z0yoOUpiSJ12GDUYoMsW9Hnzit6ACoxmKZ8dd
	 0HEP8ciDo5qQ2Clav84Lncnzlcts5KfORdN8U8UQOeV4ZaI0yJ2Gkh7JQPqEHpq8sC
	 Z+fM0ZM/BWbFxjhOHIqFZLp7qmbqGfIP9wVT2ZgbwmMaCdIcR+nms9CktE8TEp4jN/
	 B3q5Rea3IUGZA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, Jakub Kicinski <kuba@kernel.org>, 
 kernel-team@meta.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, 
 Daniel Golle <daniel@makrotopia.org>, Kees Cook <kees@kernel.org>, 
 Simon Horman <horms@kernel.org>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Jacob Keller <jacob.e.keller@intel.com>, Lee Trager <lee@trager.us>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>, 
 Alok Tiwari <alok.a.tiwari@oracle.com>, 
 Chengfeng Ye <dg573847474@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Andrew Lunn <andrew@lunn.ch>, mike.marciniszyn@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 netdev@vger.kernel.org
In-Reply-To: <20260520200337.204431-2-mike.marciniszyn@gmail.com>
References: <20260520200337.204431-2-mike.marciniszyn@gmail.com>
Subject: Re: (subset) [PATCH net-next 1/3] leds: trigger: netdev: Extend
 speeds up to 100G
Message-Id: <178178050564.2049455.9807019430641335671.b4-ty@b4>
Date: Thu, 18 Jun 2026 12:01:45 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 20 May 2026 16:03:35 -0400, mike.marciniszyn@gmail.com wrote:
> Add 25G, 40G, 50G, and 100G as available speeds to the netdev LED trigger.

Applied, thanks!

[1/3] leds: trigger: netdev: Extend speeds up to 100G
      commit: bbd8b5bdb88bf15006b078f6a2a3b452ffaa10b4

--
Lee Jones [李琼斯]

