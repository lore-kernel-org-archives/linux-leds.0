Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4F13D8108;
	Thu, 30 Apr 2026 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550721; cv=none; b=sx1TMFdGJpEN2kVMtIeqYYzGU0zPM6r1HaH5hnF+gWheC3Xi34U3BuN8mlItlZ8LEXPmQ1MVyHywZN54hYQtt2HxOUo72tigKEhGGR24j49xx7xUCElZIBZTsEaDSnfrC3x0aqmW3TOjKbBij3Hf+lEg62b0pTCWdA7NnLH7M6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550721; c=relaxed/simple;
	bh=N3ibTp/BgHed4W4JS06DUX60o/hXHOy7wdQiF1emRDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hGwVDfEd053uA9xYIMmhPCUu+KSuE0KwmVRVN9GhLbtkfJ7MInr+/FOi7Ovr6nF4JW2zC0LdQFAr/mgC6YztqBm5wVcY+LA6ib7y7vStxadFTlVDhbY4tCdUviklm0njS4c3CwXyUDA2M9/a3W6TYXoWGantfThsdDJOL78l0iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T56jwRP+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T56jwRP+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61637C2BCB3;
	Thu, 30 Apr 2026 12:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777550720;
	bh=N3ibTp/BgHed4W4JS06DUX60o/hXHOy7wdQiF1emRDk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T56jwRP+Yrvr8MD+cdOrWfUtBEE1bCfUgy4fO8YIt/oYtmvaFc5yyStxbJ5PTy0Wu
	 uNsk5xlxPAK90vRhz/PP3MSq8Te82L0yX/neLPb4iRIlfoyA3YRt4m0SeVoaNXt2QK
	 t3JBF5l/3ykkcC07ARBqXIBYLOzfDzu+Lgce/Zk4Q4PSaz//Jd/6W8A+eZTBeRNUQS
	 HQ0yEKrEsuXqsksf9Iidmk/DslX0jGKzmMGYnEl37/J7PU4/AHNU3NKZb+wwbA9ksZ
	 cYE18BPqs94mr8PB5XJonV4o4IWfMFYIl5CClShrhkvmp0acl8PZwgsJwxqFXMBmNz
	 mZFf529W684Xg==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
In-Reply-To: <20260409171555.14580-1-rosenp@gmail.com>
References: <20260409171555.14580-1-rosenp@gmail.com>
Subject: Re: (subset) [PATCHv2] leds: qcom-lpg: allocate channels with main
 struct
Message-Id: <177755071913.2532373.14484106102818819726.b4-ty@b4>
Date: Thu, 30 Apr 2026 13:05:19 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Thu, 09 Apr 2026 10:15:55 -0700, Rosen Penev wrote:
> Use a flexible array member to combine kzalloc and kcalloc. This
> required moving the struct lpg_channel definition up as flexible array
> members require a full definition.
> 
> Add __counted_by for extra runtime analysis.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: qcom-lpg: allocate channels with main struct
      commit: a745987dfab917a64188e22a30d427080e044aac

--
Lee Jones [李琼斯]

