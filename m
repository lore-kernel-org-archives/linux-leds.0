Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B33E1B4F09;
	Thu, 13 Nov 2025 13:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763041951; cv=none; b=dmetLPDGi/FAJMv/GNmgDpqTZVXwEQr19Rdl5OL39ZHEpXA9YKyG3yZNOZTQMdO5LtlPlOClquDrE9ZSVAFdc0UqtoXAIqxvpUaI97Bt+w1oZcm/9AdzX2+pCDgTT/Cs98+d7WUEUTso187inBBKTmsCBBaqpVl984fax8CEf3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763041951; c=relaxed/simple;
	bh=xIjCW+4Yvi30VBnjeO/skjFdynW0qrgZcaW3Jtnpkyc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EoXP03WEU9nK8MGTnZTstPQkHyJkwZ924LacLBqQBLuupwxvRIWt9n8Jfiju+0cwHmsXtZLa2IGo05fkiNr0LaJBYt9/VmRi0ltC1QbHkLFWUK8Ea4UxXZvSBh/oBWy6kTxkVYkSAzZIgui2sIlFs/FYOanqNQTOld2Rkv68cnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEIV9L7B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEIV9L7B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C025AC4CEFB;
	Thu, 13 Nov 2025 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763041951;
	bh=xIjCW+4Yvi30VBnjeO/skjFdynW0qrgZcaW3Jtnpkyc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nEIV9L7BJYkG/sMHERcFp66BgqANQSA4gvpn8ITuwmlnMDxTBkTcwAzuD6AvjdO+O
	 LpOG/FiKcp26Rq/QC/Km282Pswaqk8fMtDyjM5ZWgmyC7zC0MyAmYviQpstd19OZ53
	 4Vy1mgB5gjX7DZaw0Jpb+JKsBazSS5oXKezZKJky1dgrneftgF7lDaGGuLDRhKh4E5
	 wibnZ8h3ysn+HSZqq91ehLDviRBocuAq096hzXVM9OvDOSxgsSou6pFaDsYzpw1Lrn
	 byF4nnhKywi/tENxDWzZAH9MoqjBSFzC0GWv50NhlsZYcaB6DGxXdbWNffb4xUeW/9
	 zOjBgnHwgS/PA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Markus.Elfring@web.de, Haotian Zhang <vulab@iscas.ac.cn>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251031021620.781-1-vulab@iscas.ac.cn>
References: <20251031021620.781-1-vulab@iscas.ac.cn>
Subject: Re: (subset) [PATCH v3] leds: netxbig: fix GPIO descriptor leak in
 error paths
Message-Id: <176304194952.1492848.1003570657764262540.b4-ty@kernel.org>
Date: Thu, 13 Nov 2025 13:52:29 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Fri, 31 Oct 2025 10:16:20 +0800, Haotian Zhang wrote:
> The function netxbig_gpio_ext_get() acquires GPIO descriptors but
> fails to release them when errors occur mid-way through initialization.
> The cleanup callback registered by devm_add_action_or_reset() only
> runs on success, leaving acquired GPIOs leaked on error paths.
> 
> Add goto-based error handling to release all acquired GPIOs before
> returning errors.
> 
> [...]

Applied, thanks!

[1/1] leds: netxbig: fix GPIO descriptor leak in error paths
      commit: 03865dd8af52eb16c38062df2ed30a91b604780e

--
Lee Jones [李琼斯]

